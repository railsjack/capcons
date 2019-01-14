class AnswersFile < ActiveRecord::Base
  belongs_to  :answer

  validates :answer, presence: true

  mount_uploader  :file, FileUploader
end
