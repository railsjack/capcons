class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
  # validates_presence_of :first_name       

  scope :admin, -> { where(role: 'admin').where.not(username: 'admin') }

  validates_presence_of   :username
  validates_uniqueness_of :username
  validates_presence_of     :password
  validates_confirmation_of :password 
  
  has_many :tokens
  has_many :invitations 
  # has_many :projects
  has_and_belongs_to_many :projects
  has_many :created_projects, class_name: "Project", foreign_key: "creator_id"
  has_many :subordinates, class_name: "User", foreign_key: "client_id"
  belongs_to :client, class_name: "User"
 
  def whole_projects
  	self.projects
  end
  def admin?
    self.role == "admin"
  end
  def super_admin?
    self.admin? and self.username=='admin'
  end
  def client?
    self.role == "client"
  end
  def name
    return self.first_name if self.last_name.nil?
    return self.last_name if self.first_name.nil?
    "#{self.first_name}, #{self.last_name}"
  end
  # def password
  #   key = "helloworld123"
  #   encrypted_data = read_attribute(:password)
  #   AESCrypt.decrypt(encrypted_data, key)
  # end

  # def password=(pwd)
  #   key = "helloworld123"
  #   encrypted_data = AESCrypt.encrypt(pwd, key)
  #   write_attribute(:password, encrypted_data)
  # end
end
