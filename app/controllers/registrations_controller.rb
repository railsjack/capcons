 class RegistrationsController  < Devise::RegistrationsController
  # before_filter :token_verification_of_referal, :except => [:create] 
  # before_filter :admin_or_client_only, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @invitation_row = Invitation.find_by_auth_token(allow_token[:auth_token]) 
    if @invitation_row[:email] != sign_up_params[:email]
      flash[:notice] = "Please Signup from reffered email address"
      redirect_to new_user_registration_path(:auth_token => allow_token[:auth_token])
    else
      params[:user][:role] = @invitation_row.role
      if @invitation_row.role == GlobalConstants::Users::ROLES[:subordinate]
        params[:user][:client_id] = @invitation_row.user_id
      end
      build_resource(sign_up_params)
      if resource.save
        if @invitation_row.role == GlobalConstants::Users::ROLES[:client]
          resource.client_id = resource.id
          resource.save!
        end
        Invitation.update(@invitation_row[:id], :auth_token => nil)
        yield resource if block_given?
        if resource.active_for_authentication?
          set_flash_message :notice, :signed_up if is_flashing_format?
          sign_up(resource_name, resource)
          respond_with resource, location: after_sign_up_path_for(resource)
        else
          set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
          expire_data_after_sign_in!
          respond_with resource, location: after_inactive_sign_up_path_for(resource)
        end
      else
        clean_up_passwords resource
        params[:auth_token] = allow_token[:auth_token]
        respond_with resource
      end
    end  
  end
 
 
  private
 
  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :role, :client_id)
  end

  def allow_token
      params.require(:user).permit(:auth_token)
  end

  def token_verification_of_referal
    if Invitation.find_by_auth_token(params[:auth_token]).blank?
      redirect_to root_path
    end  
  end  
end