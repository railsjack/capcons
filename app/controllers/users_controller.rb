class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:new,:create,:index,:destroy,:edit,:show]
	before_filter :admin_or_client_only, only: [:new, :create, :destroy, :index]
	before_filter :find_user, only: [:edit, :destroy]
	respond_to :html,:json
	
	def new
		@user = User.new
		if current_user.admin?
			@role = "client"  
		else
			@role = "user"
			@client_id = current_user
		end
		respond_with @user
	end
	
	def create
		@user = User.new(user_params)
		if @user.save
			if current_user.admin?
				@user.role = "client"
				@user.client_id = @user.id  
			else
				@user.role = "user"
				@user.client_id = current_user.id
			end
			@user.save!
			
			# flash[:notice] = "User has been added successfully."
			# return redirect_to users_path
			respond_to do |format|
        format.html { redirect_to users_path, notice: 'User has been added successfully.' }
        format.json { render :json=> true }
    	end
		else
			respond_to do |format|
        format.html { render :new, notice: 'User has been added successfully.' }
        format.json { render :json=> true }
    	end
			
			#flash[:alert] = "User name must be unique. Try to put same coonfirmation password"
			#redirect_to :back
		end
	end

	def update
		@user = User.find(params[:id])
		user_params.delete :password
		user_params.delete :password_confirmation
		if @user.update_attributes(user_params, validate: false)
			respond_to do |format|
        format.html { render :edit, notice: 'User has been added successfully.' }
        format.json { render :json=> true }
    	end
    else
			respond_to do |format|
        format.html { render :edit}
        format.json { render :json=> false }
    	end
		end
	end


	def add_user

		@user = User.new
		notice = ''
		# puts "A"*30
		params['user']=JSON.parse(params['user'])
		@user.email = params['user']['email']
		@user.first_name = params['user']['first_name']
		@user.username = params['user']['username']
		@user.last_name = params['user']['last_name']
		@user.password = params['user']['password']
		@user.password_confirmation = params['user']['password_confirmation']
		@user.company = params['user']['company']
		@user.phone = params['user']['phone']
		@user.address = params['user']['address']
		if @user.save
			@user.role = "client"
			@user.client_id = @user.id
			@user.save!
			notice = true
		else
			notice = @user.errors
		end		
		respond_to do |format|
	        format.html {redirect_to users_path, notice: 'User has been added successfully.'}
	        format.json { render :json=> notice }
    	end
	end

	def adduser
		@user = User.new
		notice = ''
		puts "A"*30
		puts params['user']['username']
		# params['user']=JSON.parse(params['user'])
		@user.email = params['user']['email']
		@user.first_name = params['user']['first_name']
		@user.username = params['user']['username']
		@user.last_name = params['user']['last_name']
		@user.password = params['user']['password']
		@user.password_confirmation = params['user']['password_confirmation']
		@user.company = params['user']['company']
		@user.phone = params['user']['phone']
		@user.address = params['user']['address']
		# user = @user.save!
		# puts "00000"*90
		# puts user
		if @user.save
			puts "--------------"
			@user.role = "client"
			@user.client_id = @user.id
			@user.save!
			notice = true
	
			sign_in(@user)
		    redirect_to users_path, notice: 'User has been added successfully.'
		else
			# puts "====================="
			notice = @user.errors
			@user.destroy
			flash[:alert] = "User name must be unique. Try to put same confirmation password "
			redirect_to :back
	    	# redirect_to users_path, notice: 'User has been added successfully.'
		end			
	end

	def allow_access
		@user = User.find(params[:id])
		#@user.allow_web_access = !@user.allow_web_access
		#@user.save
		@user.update_attribute("allow_web_access", !@user.allow_web_access)
		redirect_to :back
	end

	def index

		if current_user.admin?
			# @users = User.all
			@users = User.where(role: "client")
		else
			@users = current_user.subordinates
		end
		respond_with @users
	end	

	def destroy
		user = User.find(params[:id])
		user.destroy if user.present?
		flash[:success] = "successfully destroyed."
		redirect_to users_path
	end
	
	def edit
		return redirect_to root_path if !current_user.admin? && current_user.id.to_s != params[:id]
		@user = User.find(params[:id])
	end

	def show
		@user = User.find(params[:id])
		respond_with @user
	end

	# def projects
	# 	user = User.find(params[:id])
	# 	@projects = user.projects
	# 	respond_with @projects
	# end

	private
	def find_user
		@user = User.find(params[:id])
	end
  	def user_params
    	params.require(:user).permit(:username,:email, :password, :password_confirmation, :first_name, :last_name,:address,:phone,:company)
  	end
end
