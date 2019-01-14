class InvitationsController < ApplicationController
	before_action :authenticate_user!
	respond_to :html, :json
 before_filter :admin_or_client_only, only: [:new, :create]

	def index
		# @invitations = current_user.invitations
		@invitations = User.all
		respond_with @invitations
	end
		
	def new
		if current_user.role == GlobalConstants::Users::ROLES[:subordinate]
			redirect_to root_path
		else
			@resource = User.new
			# @invitation = User.new
			respond_with @invitation
		end
	end

	def create
		# user = User.new
		# user.email = params[:invitation][:email]
		# user.password = params[:invitation][:password]
		# user.save!
		# flash[:success] = "successfully Saved."
		# redirect_to invitations_path
		
		params[:invitation][:user_id] = current_user.id
		params[:invitation][:auth_token] = SecureRandom.hex	
		@invitation = Invitation.new(params_invitations)
		@base_url = request.host_with_port
		if @invitation.save
			flash[:notice] = "Invitation was successfully created." 
			UserMailer.invitation(params[:invitation][:email],params[:invitation][:auth_token],@base_url ).deliver
			respond_with @invitation
		else
			flash[:danger] = "Invitation creation failed."
			render "new"
		end
		
	end

	def show
		@invitation = Invitation.find params[:id]
		respond_with @invitation
	end	

	def edit
		@invitation = Invitation.find params[:id]
		respond_with @invitation
	end

	def update
		@invitation = Invitation.find(params[:id])
    	flash[:notice] = 'Invitation was successfully updated.' if @invitation.update(params_invitations)
    	respond_with @invitation
	end

	def destroy
		@invitation = Invitation.find(params[:id])
    	respond_with @invitation.destroy
	end	

	private

	def params_invitations
		params.require(:invitation).permit(:email, :role, :user_id, :auth_token, :password)
	end	
end
