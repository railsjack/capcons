class Invitation < ActiveRecord::Base
	belongs_to :user
	validates :email, presence: true, :uniqueness => true
	attr_accessor :password

  
end
