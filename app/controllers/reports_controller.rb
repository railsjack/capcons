class ReportsController < ApplicationController
	respond_to :html, :json
	def index
		id = []
		@good_report = []
		cat_names = []
		from = params[:from]
		to = params[:to]
		user_id = params[:user_id]
		if !user_id.present? && request.format == 'application/json'
      token = Token.find_by_api(params[:authenticity_token])
			user_id = token.user.id
		end


		@project = Project.find(params[:project_id])
		remove_list = []
		@project.reports.each do |report|
			choice = Choice.where(checklist_id: report.id).first
			unless choice.present?
				remove_list << report.id
	  		sql = "delete from answers where report_id=#{report.id}"
	  		ActiveRecord::Base.connection.execute(sql)
			end
		end

		Report.where(id: remove_list).destroy_all

		if from.present? and to.present?
			to_s = (Date.today).to_s+" 23:59:59"
			from_s = (Date.today-to.to_i).to_s
			#from_s = (Date.today).to_s
			where_condition = "created_at between '#{from_s}' and '#{to_s}'"
		else
			where_condition = "1"
		end

		where_condition = "#{where_condition} and user_id=#{user_id}" if user_id.present?
		@reports = @project.reports.where(where_condition).order('created_at ASC')
		@reports1 = []
		@reports.each do |rep|
			if !rep.answers.where(status: [0,2,3]).present?
				id << rep.id
			end
			@reports1 << rep #if rep.answers.where(status: 2).count==0
		end

		@reports = @reports1
		
		@good_report = @project.reports.where(id: id)
		respond_with :obj => {:@project=> @project,:@reports=>@reports, :@good_report=> @good_report}
	end


	def get_answer
		# @question = Question.find(params[:question_id])
		@answers  = Answer.where(question_id: params[:question_id], report_id: params[:id])

		puts render :json=> @answers.to_json(:include => :answers_files)
		#respond_with @answers
	end

	def getanswerid
		#answer  = Answer.where(question_id: params[:question_id], report_id: params[:id])
		answer  = Answer.find_or_create_by(question_id: params[:question_id], report_id: params[:id])
		# @answers  = @question.answers
		puts answer.inspect
		respond_with answer
	end

	# def unresolved
	# 	@questions = Question.where(category_id: params[:category])
	# 	@
	# end

	def destroy
		report = Report.find(params[:id])
		report.destroy
		@project = Project.find(params[:project_id])
		respond_to do |format|
	        format.html { redirect_to project_reports_path(@project), success: 'Users add successfully.' }
	        format.json { render :json=> true }
	    end
	end

	def show
		@report = Report.find(params[:id])
		@project = @report.project
		@categories = Category.all.includes(:questions)
		@answers = @report.answers
		# respond_with :obj => {project: @project, categories: @categories, answers: @answers}
	end

	def answers
		@report = Report.find(params[:id])
		@answers = @report.answers
		respond_with @answers
	end

	def detail_report
		@report = Report.find(params[:id])
  		respond_to do |format|
    		format.html
    		format.json { render :json=> true} 
    		format.pdf do
      		pdf = ReportDetailPdf.new(@report, view_context)
      		send_data pdf.render, filename: "(#{@report.name}) report.pdf", type: "application/pdf", disposition: "attachment"
    		end
 		end
	end
end

