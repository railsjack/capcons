class CategoriesController < ApplicationController
	respond_to :html, :json, only: [:index,:questions,:question]
	def index
		choice = Choice.where(checklist_id: params[:report]).first
		# @status = ''
		if choice.present?
			@category = Category.where(id: choice.category_id)
			# @status = false
		else
			@category = Category.all
			# @status = true
			# respond_with @category
		end
		respond_with :obj => { category: @category}
	end

	def answers
		@report = Report.find(params[:report_id])
		@category = Category.find(params[:id])
	end

	def questions
		questionlist_mode = params[:questionlist_mode]
		if questionlist_mode == 'nonexisting'
			category_id = params[:id]
			report_id = params[:report_id]
			@choice = Choice.find_or_create_by(checklist_id: report_id)
			@choice.category_id = category_id
			@choice.save
			@report = Report.find(report_id)
			@report.category_id = category_id
			@report.submitted = true
			@report.save
		else
			report_id = params[:report_id]
			@choice = Choice.find_or_create_by(checklist_id: report_id)
			@report = Report.find(report_id)
			category_id = @report.category_id
		end


		@category = Category.find(category_id)
		#@questions = @category.questions
		@questions = @category.questions
		qids = @category.questions.pluck(:id)
		sql = "delete from answers where report_id=#{report_id} and question_id not in (#{qids.join(',')})"
		ActiveRecord::Base.connection.execute(sql)
		@answers = Answer.where(report_id: report_id, question_id: qids)
		puts @answers.inspect
		respond_with @questions
	end

	def question
		@status = false
		@category = Category.find(params[:id])
		@question = @category.questions.first
		choice = Choice.where(checklist_id: params[:report]).first

		@noanswer = false
		qids = @category.questions.pluck(:id)
		answers = Answer.where(report_id: params[:report], question_id: qids, status: 2)
		if answers.count > 0
			@noanswer = true
		end
		# cats = Category.where.not(id: @category.id)
		# # cats.each do |c|
		# 	cats.first.questions.each do |q|
		# 		q.answers.first.destroy if  q.answers.first.present?
		# 	end
		# # end

		if !choice.present?
			choice = Choice.new
			choice.checklist_id = params[:report]
			choice.category_id = @category.id
			choice.save!
		else
			@status = true
		end
		@answer = Answer.where(question_id: @question.id, report_id: params[:report]).first
	end

	def no_questions
		@category = Category.find(params[:id])
		# choice = Choice.where(checklist_id: params[:report]).first
		q_ids = []
		@category.questions.each do |q|
			ans = q.answers.find_by(report_id: params[:report])
			if ans.status == 2
				q_ids << q.id
			end
		end
		questions = Question.where(id: q_ids)
		return render :json=> questions
	end
end
