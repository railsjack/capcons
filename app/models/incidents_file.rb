class IncidentsFile < ActiveRecord::Base
  belongs_to  :incident

  validates :incident, presence: true

  mount_uploader  :file, FileUploader
end
