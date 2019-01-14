class Jobhazard < ActiveRecord::Base
	belongs_to :project
	has_many	:jobhazards_files, :inverse_of => :jobhazard, :dependent => :destroy
	accepts_nested_attributes_for	:jobhazards_files, allow_destroy: true

	# validates_presence_of :sow
	# validates_presence_of :criticalsteps
	# validates_presence_of :situations
	# validates_presence_of :worsthappen
	# validates_presence_of :defenses

	mount_uploader :file, FileUploader

end
