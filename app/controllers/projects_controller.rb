class ProjectsController < ApplicationController	
	before_action :authenticate_user!
	before_action :check_user
	before_action :set_project, only: [:edit, :update, :destroy, :detail_report]
	respond_to :html, :json, only: [:index, :new, :create, :edit, :show, :destroy,:assign_project,:add_users,:reports,:users]
	
	def index
		if current_user.role == "user"
			@projects = current_user.whole_projects
		else
			@projects = get_projects_by_user_id(0)
		end

		# if @projects.present?
		# puts "----index"*90
		#puts @projects.inspect
			respond_with @projects
		# else
		
		# end	
	end	

	def new 
		@project = Project.new
		respond_with @project
	end

	def categories
		if params[:report].present?
			@report = Report.find(params[:report])
			choice = Choice.where(checklist_id: @report.id).first
			if choice.present? && !choice.category_id.nil?
				@categories = Category.where(id: choice.category_id)
			else
				@categories = Category.all
			end
		end
		@project = Project.find(params[:id])		
	end

	def checklist
		@project = Project.find(params[:id])
		@reports = @project.reports
		@category = params[:cat]
	end

	def submit_report
		@project = Project.find(params[:id])
		token = Token.find_by_api(params[:authenticity_token])
		user = token.user		
		report = @project.reports.build
		report.name = "#{@project.name} Report #{Date.today.to_s}"
		report.user_id = user.id
		report.save!
		sql = "insert into answers(question_id, report_id, created_at,  updated_at) select questions.id, #{report.id}, now(), now() from questions"
		ActiveRecord::Base.connection.execute(sql)
    #Question.all.each do |q|
      #Answer.create!(question_id: q.id, report_id: report.id, file: nil)		
		#end
		return render :json=> report
	end

	def create
		# puts "===="*90
		user_client = current_user.client
		params[:project][:creator_id] = current_user.id 
		@project = user_client.projects.build(params_project)
		
		# @project.user_id = current_user.id
		# @project = user_client.build_projects(params_project)
		if @project.save
			if current_user.role == "client"
				users = params[:project][:userid] if params[:project][:userid].present?
				users && users.each do |user|
					if user != ""
						project_user = ProjectsUsers.new
						project_user.user_id = user.to_i
						project_user.project_id = @project.id
						project_user.save!
=begin
						@report = @project.reports.build
				  		@report.name = "#{@project.name} Report #{Date.today.to_s}"
				  		@report.user_id = user.to_i
				  		@report.save!
					    Question.all.each do |q|
					      Answer.create!(question_id: q.id, report_id: @report.id, file: nil)		
						end
=end
					end	
				end
			end
			# if current_user.role == "user"
				report = Report.where(user_id: current_user.id, project_id: @project.id).first
				if !report.present?
=begin
					@report = @project.reports.build
			  		@report.name = "#{@project.name} Report #{Date.today.to_s}"
			  		@report.user_id = current_user.id
			  		@report.save!
				    Question.all.each do |q|
				      Answer.create!(question_id: q.id, report_id: @report.id, file: nil)		
					end
=end
				end
				project_user = ProjectsUsers.where(user_id:current_user.id, project_id: @project.id).first || ProjectsUsers.new
				project_user.user_id = current_user.id
				project_user.project_id = @project.id
				project_user.save!
			# end
		flash[:notice] = "Project was successfully created." 
		end

		respond_to do |format|
			# flash[:notice] = "Project was successfully created." 
			format.html { redirect_to report_project_path(@project), success: "Project successfully created." }
	        format.json {  render json: @project} 
		end
		# respond_with @project
	end	

	def update_answer
		puts "======="*90
		puts "project"
		answer = Answer.find(params[:id])
		
		answer.notes = params[:answer][:notes]
		answer.file = params[:answer][:file]
		answer.save!
		return render :json=> true
	end

	def show
		category_id = params[:cat]
		report_id = params[:rep]

		@report = Report.find_by(project_id: params[:id])
		if @report.present?
			choice = Choice.where(checklist_id: @report.id).first
			if choice.present?
				@category = Category.where(id: category_id).first
			else
				# @categories = Category.all
				choice = Choice.new
				choice.checklist_id = @report.id
				choice.category_id = params[:cat]
				choice.save!
				@category = Category.includes(:questions).where(id: params[:cat]).first
				@report.submitted = true
				@report.save
			end
		end

		@project  = Project.find(params[:id])
		@answers = Answer.where(report_id: report_id)
		respond_with :obj => {project: @project, categories: @categories, answers: @answers}
	end	

	def report
		@red_30 = false
		@red_60 = false
		@red_90 = false
		
		@days_30 = 0
		@days_60 = 0
		@days_90 = 0
		@days_ytd = 0

		if params[:id]=='0'
			projects = get_projects_by_user_id(0) #current_user.projects #Project.all
		else
			projects = Project.where(id: params[:id])
		end

		@days_30 = 0
		@days_60 = 0
		@days_90 = 0

		projects.each do |project|
			@project = project

			@all_users = ProjectsUsers.where(project_id: params[:id])
			aa = ""
			@all_users.each do |project_user|
				@uname = project_user.user.name
				aa = "#{@uname},#{aa}"
			end
			@uname = aa.chomp(",")
			to_s = (Date.today).to_s+" 23:59:59"
			from_s = (Date.today-29).to_s
			@reports_30 = reports_by_period(params, @project, from_s, to_s)
			

			@all_reports = {}
			@reports_30 && @reports_30.each do |rep|
				@red_30 = false
				if rep.answers.where(status: 2).present?
					@days_30 += 1
					@red_30 = true
				end
				@all_reports[rep.user_id] = @all_reports[rep.user_id] || {}
				begin @all_reports[rep.user_id][:user] = User.find(rep.user_id) 
				rescue
				end
				if @all_reports[rep.user_id][:count_30] == nil
					@all_reports[rep.user_id][:count_30] = 0
				end

				if @red_30
					@all_reports[rep.user_id][:count_30] += 1
				end
			end

			
			#to_s = (Date.today-30).to_s+" 23:59:59"
			to_s = (Date.today).to_s+" 23:59:59"
			from_s = (Date.today-59).to_s
			@reports_60 = reports_by_period(params, @project, from_s, to_s)
			

			@reports_60 && @reports_60.each do |rep|
				@red_60 = false
				if rep.answers.where(status: 2).present?
					@days_60 += 1
					@red_60 = true
				end
				@all_reports[rep.user_id] = @all_reports[rep.user_id] || {}
				begin @all_reports[rep.user_id][:user] = User.find(rep.user_id) 
				rescue
				end

				if @all_reports[rep.user_id][:count_60] == nil
					@all_reports[rep.user_id][:count_60] = 0
				end

				if @red_60
					@all_reports[rep.user_id][:count_60] += 1
				end

			end

			# @reportsports_90 = @project.reports.where("created_at >= ? OR created_at< ?", Date.today-90.days,Date.today-90.days)
			#to_s = (Date.today-60).to_s+" 23:59:59"
			to_s = (Date.today).to_s+" 23:59:59"
			from_s = (Date.today-89).to_s
			@reports_90 = reports_by_period(params, @project, from_s, to_s)		

			@reports_90 && @reports_90.each do |rep|
				@red_90 = false
				if rep.answers.where(status: 2).present?
					@days_90 += 1
					@red_90 = true
				end
				@all_reports[rep.user_id] = @all_reports[rep.user_id] || {}
				begin @all_reports[rep.user_id][:user] = User.find(rep.user_id) 
				rescue
				end
				if @all_reports[rep.user_id][:count_90] == nil
					@all_reports[rep.user_id][:count_90] = 0
				end
				if @red_90
					@all_reports[rep.user_id][:count_90] += 1
				end
			end		

			to_s = (Date.today).to_s+" 23:59:59"
			from_s = "#{Date.today.year}/1/1"
			@reports_ytd = reports_by_period(params, @project, from_s, to_s)

			@reports_ytd && @reports_ytd.each do |rep|
				@red_ytd = false
				if rep.answers.where(status: 2).present?
					@days_ytd += 1
					@red_ytd = true
				end
				@all_reports[rep.user_id] = @all_reports[rep.user_id] || {}
				begin @all_reports[rep.user_id][:user] = User.find(rep.user_id)
				rescue
				end
				if @all_reports[rep.user_id][:count_ytd] == nil
					@all_reports[rep.user_id][:count_ytd] = 0
				end
				@all_reports[rep.user_id][:count_ytd] += 1 if @red_ytd
			end

			#@days_ytd += @reports_ytd.count

		end
	end

	def users
		@project = Project.find(params[:id])
		@users = @project.users
		respond_with @users
	end

	def unassign
		@project = Project.find(params[:id])
		proj_user = ProjectsUsers.where(project_id: @project.id, user_id: params[:uid]).first
		proj_user.destroy if proj_user.present?
		flash[:success] = "Unassigned successfully."
		redirect_to users_project_path(@project)
	end

	def edit
		respond_with @project
	end

	def update
    	flash[:notice] = 'Project was successfully updated.' if @project.update(params_project)
    	# return render json: :true	
    	respond_to do |format|
    		format.html { redirect_to projects_path, notice: 'Project was successfully updated.'}
    		format.json {render :json=> true}
 		end
	end

	def destroy
    	respond_with @project.destroy
	end	

	def detail_report
		if params[:report] == nil 
			render :text=>"Unable to download the file." and return
		end
		report = Report.find(params[:report])
		respond_to do |format|
  		format.html
  		format.json {render :json=> true}
  		format.pdf do
    		pdf = ProjectDetailPdf.new(@project, view_context,report)
    		send_data pdf.render, filename: "(#{@project.name}) project report.pdf", type: "application/pdf", disposition: "attachment"
  		end
 		end
	end

	def assign_project
		@project = Project.find(params[:id])
		@users = current_user.subordinates
		# respond_with @project
	end


	def add_users
		
		id = params[:projectid]
		users = params[:project][:userid] if params[:project][:userid].present?
		project = Project.find(id)
		users && users.each do |user|
			if user != ""
				project_user =  ProjectsUsers.where(user_id: user , project_id: id).first || ProjectsUsers.new
				project_user.user_id = user.to_i
				project_user.project_id = id.to_i
				project_user.save!	
				report = Report.find_by_user_id(user.to_i)
				if !report.present?
					report = project.reports.build
					report.name = "#{project.name} Report #{Date.today.to_s}"
					report.user_id = user.to_i
					report.save!
					sql = "insert into answers(question_id, report_id, created_at,  updated_at) select questions.id, #{report.id}, now(), now() from questions"
					ActiveRecord::Base.connection.execute(sql)
					#Question.all.each do |q|
					#	Answer.create!(question_id: q.id, report_id: report.id, file: nil)		
					#end
				end	
			end	
		end
		# respond_with project_user
		respond_to do |format|
	        format.html { redirect_to projects_path, notice: 'Users add successfully.' }
	        format.json { render :json=> true }
	    end
		# flash[:success] = "Users add successfully"
		# redirect_to projects_path		
	end

	private

	def params_project
		params.require(:project).permit(:name, :contact_info, :address, :user_id, :creator_id, :userid)
	end

	def check_user
		# puts "11111"*90
		if current_user.role == 'admin'
			# puts "0000"*90
			flash[:notice] = 'You are not Authorise'
			return redirect_to root_url
		end	
	end	

	def set_project
		@project = current_user.whole_projects.find(params[:id])
	end

	def reports_by_period(params, project, from, to)
		unless params[:user_id].nil?
			user_id = params[:user_id].to_s
			if user_id == '0'
				reports_loop = project.reports.where("(created_at between ? and ? )", from, to)
			else
				reports_loop = project.reports.where("(created_at between ? and ? ) and user_id= ?", from, to, user_id)
			end
		else
			reports_loop = project.reports.where("(created_at between ? and ? )", from, to)
		end

		reports = []
		ids = []
		reports_loop.each do |report|
			if ids.index(report.id)==nil
				ids << report.id
			else
				next
			end
			reports << report #if report.answers.where('status=2').count==0
		end
		reports
	end

	def get_projects_by_user_id(user_id)
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
