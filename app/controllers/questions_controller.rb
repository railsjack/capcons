class QuestionsController < ApplicationController
	respond_to :html, :json, only: [:index,:get_question]
	def index
		@questions = Question.all
		respond_with @questions
	end
	
	def get_question
		@question = Question.find(params[:id])
		# @answer = Answer.where(question_id: params[:id], report_id: params[:rep_id]).first
		return render json: @question
		# respond_with @question
	end
end
