class StatsController < ApplicationController
  def index
  	@users = [{id: 0, name: 'All Users'}]
    users = current_user.subordinates unless current_user.nil?
  	users.each do |user|
  		next if user.admin?
  		if user.projects.count>0
  			@users << {id: user.id, name: user.name}
  		end
  	end
  	#@projects = []
  	#User.find(@users.first[:id]).projects.all.each do |project|
  	#	@projects << {id: project.id, name: project.name}
  	#end

    #render :text=>current_user.subordinates.count and return

    @all_projects = get_projects_by_user_id(0)

  	@to_s = DateTime::now.strftime('%m/%d/%Y')
  	@from_s = (DateTime::now-30.days).strftime('%m/%d/%Y')
  end

  def get_data
  	case params[:method]
  		#1. HOW MANY CHECKLISTS WERE COMPLETED THE PAST 30 DAYS, 60 DAYS, 90 DAYS AND YTD?
  		when 'get_projects'
        user_id = params[:user_id]
        projects = get_projects_by_user_id(user_id)
  			render json: {projects: projects}
  			return


  		#1. HOW MANY CHECKLISTS WERE COMPLETED THE PAST 30 DAYS, 60 DAYS, 90 DAYS AND YTD?
  		when 'get_stat1'
  			user = User.find(params[:user_id])
  			project = user.projects.find(params[:project_id])
  			
  			return

  		#2. HOW MANY OPEN ISSUES ARE OVER 7, 30 DAYS AND GREATER THAN 30 DAYS OUTSTANDING ?
  		when 'get_stat2'
        if params[:user_id] == '0'
          users = User.where(client_id: current_user.client_id)
        else
          users = User.where(id: params[:user_id])
        end
        over_7=0
        over_30 = 0
        over_30_more = 0
        users.each do |user|
    			#user = User.find(params[:user_id])

          if params[:project_id] == '0'
            projects = user.projects
          else
            projects = user.projects.where(id: params[:project_id])
          end
          projects.each do |project|
            project.reports.each do |report|
              over_7 = over_7 + report.answers.where("status=2 and datediff(now(),created_at) > 7").count
            end
            project.reports.each do |report|
              over_30 = over_30 + report.answers.where("status=2 and datediff(now(),created_at) > 30").count
            end
            project.reports.each do |report|
              over_30_more = over_30_more + report.answers.where("status=2 and datediff(now(),created_at) > 60").count
            end
          end


          puts "over_7 : #{user.name}"
          puts over_7


        end


        render json: {
          over_7: over_7,
          over_30: over_30,
          over_30_more: over_30_more
        }
  			return
  		#3. HOW MANY SAFETY CATEGORIES WERE REVIEWED OVER THE PAST 30 DAYS, 60 DAYS, 90 DAYS AND YTD?
  		when 'get_stat3'
  			n_30 = 0
  			n_60 = 0
  			n_90 = 0

        categories_30 = []
        categories_60 = []
        categories_90 = []

        if params[:user_id]=='0'
          users = User.where(client_id: current_user.client_id)
        else
          users = User.where(id: params[:user_id])
        end
        users.each do |user|
          if params[:project_id] == '0'
            projects = user.projects
          else
            projects = user.projects.where(id: params[:project_id])
          end

          projects.each do |project|
            next if project.creator.nil?
            next unless user.id == project.creator.id
            #categories = []
            project.reports.where("datediff(now(),created_at) <= 30").each do |report|
              next if report.category.nil?
              category_id = report.category.id
              if !categories_30.include?category_id
                categories_30 << category_id
                n_30 = n_30 + 1
              end
            end

            #categories = []
            project.reports.where("datediff(now(),created_at) <= 60").each do |report|
              next if report.category.nil?
              category_id = report.category.id
              if !categories_60.include?category_id
                categories_60 << category_id
                n_60 = n_60 + 1
              end
            end

            #categories = []
            project.reports.where("datediff(now(),created_at) <= 90").each do |report|
              next if report.category.nil?
              category_id = report.category.id
              #if categories.index(category_id)==nil
              if !categories_90.include?category_id
                categories_90 << category_id
                n_90 = n_90 + 1
              #else
              #  a_b = 2
              end
            end
            #a_b = 2
          end

        end

  			render json: {
  				n_30: n_30,
  				n_60: n_60,
  				n_90: n_90
  			}
  		#4. SORT AND RANK
  		when 'get_stat4'
  			@projects = []
  			from_s = params[:from_s]
  			to_s = params[:to_s]
        project_id = params[:project_id]


  			from_date = DateTime.strptime(from_s, '%m/%d/%Y')
  			to_date = DateTime.strptime(to_s, '%m/%d/%Y')

  			number_of_days = (to_date.mjd - from_date.mjd).abs
  			number_of_months = (number_of_days/30).to_i | 1

        

        if project_id == '0'
          if current_user.role == "user"
            arr_projects = current_user.projects
          else
            arr_projects = get_projects_by_user_id_2(0);
          end
          arr_projects.map{|i| i.id}
          projects = Project.where(:id => arr_projects)
        else
          projects = current_user.projects.where(id: project_id)
        end

        projects = projects.where(['projects.created_at between ? and ?', from_date, to_date])

				projects.each do |project|
					report_users = project.reports.select(:user_id).map(&:user_id).uniq
          report_users.each do |usr|
            # count categories
            categories = []
            category_count = 0

            # count checklists
            checklist_count = 0
            all_checklist_count = 0

            # count issues
            issue_count = 0

            # 'year_month's array
            yms = []

            project_reports = project.reports.where("user_id= ?", usr)
            project_reports.all.each do |report|
              unless report.category.nil?

                all_checklist_count += 1
                if report.answers.where('status=2').count == 0
                  checklist_count += 1
                  category_id = report.category.id
                  if categories.index(category_id)==nil
                    categories << category_id
                    category_count += 1
                  end
                else
                  issue_count += 1
                end
              end
            end
            @projects << {
                id: project.id,
                project_name: project.name,
                employee_name: User.find(usr).name,
                number_of_days: number_of_days,
                checklist_count: checklist_count,
                category_count: category_count,
                issue_count: issue_count,
                avg_of_months: yms.count>0?(all_checklist_count/yms.count).to_i : 0,
                max_checklists_of_months: 0,
                min_checklists_of_months: 0
            }
          end
        end

				case params[:sort_by]
				when 'avg'
					@projects = @projects.sort_by{|v| v[:avg_of_months]}.reverse
				when 'max'
					@projects = @projects.sort_by{|v| v[:max_checklists_of_months]}.reverse
				when 'min'
					@projects = @projects.sort_by{|v| v[:min_checklists_of_months]}.reverse
				else
					@projects = @projects.sort_by{|v| v[:avg_of_months]}.reverse
				end

				render json: {projects: @projects}
				return
      #5. NUMBER OF INCIDENT REPORTS PER PERSON AND BY PROJECT.
      when 'get_stat5_1'
        
        project_id = params[:project_id].to_i
        user_id = params[:user_id].to_i
        from_s = params[:from_s]
        to_s = params[:to_s] + ' 23:59:59'
        from_date = DateTime.strptime(from_s, '%m/%d/%Y')
        to_date = DateTime.strptime(to_s, '%m/%d/%Y %H:%M:%S')

        incident_count = 0
        project_ids = []
        if user_id == 0
          users = current_user.subordinates
        else
          users = current_user.subordinates.where(id: user_id)
        end
        #users = current_user.subordinates
        users.each do |user|
          user.projects.each do |project|
            next if user_id!=0 and project.creator.id != user_id or project_ids.index(project.id)!=nil
            project_ids << project.id

            n = project.incidents.where(['incidents.created_at between ? and ?', from_date, to_date]).count
            incident_count += n
          end
        end
        render json: {incident_count: incident_count}

      when 'get_stat5_2'
        project_id = params[:project_id].to_i
        from_s = params[:from_s]
        to_s = params[:to_s] + ' 23:59:59'
        from_date = DateTime.strptime(from_s, '%m/%d/%Y')
        to_date = DateTime.strptime(to_s, '%m/%d/%Y %H:%M:%S')

        incident_count = 0
        users = current_user.subordinates
        project_ids = []
        users.each do |user|
          #project_ids = []
          user.projects.each do |project|
            next if project_id!=0 and project.id != project_id or project_ids.index(project.id) != nil
            project_ids << project.id
            n = project.incidents.where(['incidents.created_at between ? and ?', from_date, to_date]).count
            incident_count += n
          end
        end



        render json: {incident_count: incident_count}

      when 'get_issues'
        key = params[:key]
        @projects = []
        ids = []
        users = current_user.subordinates
        users.each do |user|
          projects = user.projects
          projects.each do |project|
            next unless ids.index(project.id)==nil
            ids << project.id
            incidents = []
            project.incidents.where(['report_type like ?', "%#{key}%"]).each do |incident|
              incidents << {id: incident.id, 
                name: incident.report_type, injury_date: incident.injury_date, created_at: incident.created_at
              }
            end
            #if incidents.count>0
              @projects << {
                id: project.id,
                name: project.name,
                incidents: incidents
              }
            #end
          end
        end
        render json: {projects: @projects}
      when 'get_stat7'
        from_s = params[:from_s]
        to_s = params[:to_s] + ' 23:59:59'
        from_date = DateTime.strptime(from_s, '%m/%d/%Y')
        to_date = DateTime.strptime(to_s, '%m/%d/%Y %H:%M:%S')
        user_id = params[:user_id]
        project_id = params[:project_id]

        if user_id == '0'
          users = current_user.subordinates # User.all
        else
          users = User.where(id: user_id)
        end

        completed_checklists = 0
        data = {}
        category = []
        response_data = []
        project_ids = []
        users.each do |user|
          if project_id == '0'
            projects = user.projects
          else
            projects = user.projects.where(id: project_id)
          end
          projects.each do |project|
            next unless project_ids.index(project.id)==nil
            project_ids << project.id

            project.reports.where(['created_at between ? and ?', from_date, to_date]).each do |report|
              md = report.created_at.strftime("%Y/%m/%d")
              data["#{md}"] = 0 if data["#{md}"] == nil
              #unless report.category.nil?
                if report.answers.where(status: 2).present?
                  data["#{md}"] += 1
                end
              #end
            end
          end
        end

        from_date.upto(to_date){|date|
          md = date.strftime("%Y/%m/%d")
          data["#{md}"] = 0 if data["#{md}"] == nil

          category << date.strftime("%m/%d")
          response_data << data["#{md}"]
        }

        render json: {data: response_data, category: category}
  	end
  end


  private

  def get_projects_by_user_id(user_id)
    if user_id == '0' or user_id==0
      users = current_user.subordinates
    else
      users = User.where(id: user_id)
    end
    projects = [{id: 0, name: 'All Projects'}]
    ids = []
    users.each do |user|
      user.projects.each do |project|
        if ids.index(project.id) == nil
          projects << {id: project.id, name: project.name}
          ids << project.id
        end
      end
    end

    return projects
  end

  def get_projects_by_user_id_2(user_id)
    if user_id == '0' or user_id==0
      users = current_user.subordinates
    else
      users = User.where(id: user_id)
    end
    projects = []
    ids = []
    users.each do |user|
      user.projects.each do |project|
        if ids.index(project.id) == nil
          projects << project
          ids << project.id
        end
      end
    end

    return projects
  end

end


