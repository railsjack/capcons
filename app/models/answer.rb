class Answer < ActiveRecord::Base

	belongs_to :question
	# belongs_to :project
	belongs_to :report

	has_many	:answers_files, :inverse_of => :answer, :dependent => :destroy
	accepts_nested_attributes_for	:answers_files, allow_destroy: true

	mount_uploader :file, FileUploader
end
