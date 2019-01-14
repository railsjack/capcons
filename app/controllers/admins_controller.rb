class AdminsController < ApplicationController
	before_filter :setup_admin
  def index
  	@admins = User.admin.all
  end

  def new
  end

  def edit
  end

  def create
  	user = User.new(user_params)
  	user.role = 'admin'
  	if user.save
  		redirect_to admins_path
  	else
  		redirect_to new_admin_path, alert: 'Please enter the valid values'
  	end
  end

  def destroy
  	user = User.find(params[:id])
  	user.destroy
  	redirect_to admins_path
  end

  private
  def setup_admin
  	@user = User.new
  	@user.role = 'admin'
  end

	def user_params
  	params.require(:user).permit(:username,:email, :password, :password_confirmation)
	end

end
