class Project < ActiveRecord::Base
	belongs_to :creator, class_name: "User"
	# belongs_to :user
	has_and_belongs_to_many :users
	# has_many :answers, dependent: :destroy
	has_many :reports,dependent: :destroy
	has_many :incidents, dependent: :destroy
	has_many :jobhazards, dependent: :destroy
	
	validates_presence_of :address
	validates_presence_of :contact_info
	attr_accessor :userid
	
	after_create :create_answers
  	
  	def create_answers
  		# report = self.reports.build
  		# # report.name = Date.today.to_s
  		# report.name = "#{self.name} Report #{Date.today.to_s}"
  		# report.save!
	   #  Question.all.each do |q|
	   #    # report.answers.create!(question_id: q.id)
	   #    # report.answers << Answer.create!(question_id: q.id)
	   #    Answer.create!(question_id: q.id, report_id: report.id, file: nil)	
	    # end
  	end
end
