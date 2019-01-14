class Report < ActiveRecord::Base
	belongs_to :project
	belongs_to :category
	has_many :answers, dependent: :destroy
	has_one :choice, :class_name => 'Choice', :foreign_key => :checklist_id


	def self.default_scope
		where submitted: true
	end
end
