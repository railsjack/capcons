class SessionsController < Devise::SessionsController
  prepend_before_filter :require_no_authentication, :only => [:create, :new ]

  # before_filter :ensure_params_exist, only: [:create]
 
  respond_to :json, :html
  def create
    if request.method == "options" || request.method=="OPTIONS"
      render :nothing => true, :status => 200
      return 
    end
    email = ""
    password = ""
    username = ""
    if request.format == "json"
      email = params[:data][:user][:email] 
      password = params[:data][:user][:password]
      username = params[:data][:user][:username] 
    else
      puts "---"*90
      email = params[:user][:email]
      password = params[:user][:password]
      username = params[:user][:username]
    end

    # resource = User.find_for_database_authentication(email: email) 
    resource = User.find_for_database_authentication(username: username)
    # return invalid_login_attempt unless resource

    if request.format == "text/html" && !resource.allow_web_access
      respond_to do |format|
        format.html {
          flash[:alert] =  "Web access has been disabled for this user"
          redirect_to :back
        }
      end
      return
    end
    if resource && resource.valid_password?(password)
      sign_in(resource)
      random = SecureRandom.hex
      resource.tokens << Token.create!(api: random)
      resource.save

      respond_to do |format|
	        format.html { redirect_to root_path}
	        format.json { render :json=> {user: resource, authenticity_token: random }}
	    end
      return
    else
      respond_to do |format|

        format.html {  
          flash[:alert] =  "Error with your login or password"
          redirect_to :back
        }
        format.json { render :json=> invalid_login_attempt}
      end
    end
    # invalid_login_attempt 
  end
  # def create
  #   resource = User.find_for_database_authentication(:email=>params[:user][:email])
  #   return invalid_login_attempt unless resource
 
  #   if resource.valid_password?(params[:user][:password])
  #     sign_in("user", resource)
  #   respond_to do |format|
  #         format.html { redirect_to root_path}
  #         format.json { render :json=> resource }
  #     end
  #     return
  #   end
  #   invalid_login_attempt
  # end
  
  def destroy
    sign_out(resource_name)
    resource.try(:tokens).try(:destroy_all)
    
    respond_to do |format|
	        format.html { redirect_to root_path}
	        format.json { render :json=>  true} #resource
	    end
    
  end
 
  protected
  def ensure_params_exist
    return unless params[:user].blank?
	respond_with resource, status: 404
  end
 
  def invalid_login_attempt
    warden.custom_failure!
    render :json=> {:success=>false, :message=>"Error with your login or password"}, :status=>200
  end
end
