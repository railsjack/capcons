class JobhazardsFile < ActiveRecord::Base
  belongs_to  :jobhazard

  validates :jobhazard, presence: true

  mount_uploader  :file, FileUploader
end
