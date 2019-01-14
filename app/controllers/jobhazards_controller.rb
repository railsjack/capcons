class JobhazardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [ :index,:new, :create, :show]
  before_action :set_jobhazard, only: [:show]

  respond_to :html, :json, only: [:index, :new, :show,:view_jobhazard]

  # GET /jobhazards
  # GET /jobhazards.json
  def index
    remove_empty_jobhazard
    @jobhazards = @project.jobhazards

    respond_to do |format|
      format.html { @jobhazards }
      format.json { render json: @jobhazards }
    end
  end

  def view_jobhazard
    @jobhazard = Jobhazard.find(params[:id])
    #@jobhazard_file = @jobhazard.jobhazards_files.where("jobhazard_id = ?", params[:id])
    #@jobhazard_file.file = @jobhazard_file.file.thumb
    #return render :json=> @jobhazard, :include => :jobhazards_file
    return render :json=> @jobhazard.to_json(:include => :jobhazards_files)
  end

  # GET /jobhazard/1
  # GET /jobhazard/1.json
  def show
    # respond_with @jobhazard
  end

  # GET /incidents/new
  def new
    @jobhazard = Jobhazard.new
    respond_with @jobhazard
  end

  # GET /incidents/1/edit
  # def edit
  #   respond_with @incident
  #   respond_with @incident
  def empty_jobhazard
    project = Project.find(params[:project_id])
    jobhazard = project.jobhazards.build
    jobhazard.save!
    return render :json=> jobhazard
  end
  # end
  def upload_image
    # project = Project.find(params[:project_id])
    jobhazard = Jobhazard.find(params[:id])
    jobhazard.file = uploaded_picture(params[:jobhazard][:file]) if params[:jobhazard][:file].present?
    jobhazard.save!
    return render :json=>{url: jobhazard.file.thumb.url}
  end


  def create
    if(params[:incId]).present?
      @jobhazard = Jobhazard.find(params[:incId])
      @jobhazard.sow = params[:jobhazard][:sow] 
      @jobhazard.criticalsteps = params[:jobhazard][:criticalsteps]
      @jobhazard.situations = params[:jobhazard][:situations]
      @jobhazard.worsthappen = params[:jobhazard][:worsthappen]
      @jobhazard.defenses = params[:jobhazard][:defenses]
    else
      @jobhazard = @project.jobhazards.build(jobhazard_params)
    end


  
    respond_to do |format|
      if @jobhazard.save
        if params[:files]
          params[:files].each { |image|
            @jobhazard.jobhazards_files.create(file: image, jobhazard_id: @jobhazard.id)
          }
        end
        @jobhazard.save!
        format.html { redirect_to projects_path({jha: @jobhazard.id}), notice: 'Job hazard analysis was successfully created.' }
        format.json {  render json: {jobhazard_id: @jobhazard.id} }  
        # format.json { render action: 'show', status: :created, location: @incident }
      else
        format.html { render action: 'new' }
        format.json { render json: :true}
        # format.json { render json: @incident.errors, status: :unprocessable_entity }
      end
    end
  end

   def send_email_by_jobhazard
    jobhazard = Jobhazard.find(params[:id])
    jobhazards_file = JobhazardsFile.where(jobhazard_id: params[:id])
    project = jobhazard.project
    @user = current_user
    to = params[:email]
    UserMailer.send_jobhazard_report_by_jobhazard(current_user,jobhazard, jobhazards_file,project.name,to).deliver
    respond_to do |format|
      format.html { render :text=>'success' }
      format.json { render json: :true }
    end
   end

  def send_new_jobhazard
    @jobhazard = Jobhazard.find(params[:id])
    @jobhazard_file = @jobhazard.jobhazards_files.where("jobhazard_id = ?", params[:id])
    respond_to do |format|
      format.html
      format.json
      format.pdf do
        # if @incident.downloaded.blank?
          pdf = JobhazardPdf.new(@jobhazard)
          @jobhazard_file.each do |jfile|
            file = "#{Rails.root}/public#{jfile.file_url}"
            pdf.image file, :fit => [450,350]
          end 
          @jobhazard.update!(downloaded: true)
          send_data pdf.render, filename: "(Your new job hazard analysis on project #{@jobhazard.project.name}).pdf", type: "application/pdf", disposition: "attachment"
        # else
          # redirect_to projects_path
        # end
      end
    end
  end

  private

    def uploaded_picture(base64)

      tempfile = Tempfile.new ['upload', '.jpg']
      tempfile.binmode
      tempfile.write(Base64.decode64(base64))
      tempfile.close
      #image = MiniMagick::Image.open(tempfile.path)
      #image.rotate "90"
      #image.write tempfile.path

      tempfile
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = current_user.whole_projects.find(params[:project_id])
    end
    def set_jobhazard
      @jobhazard = @project.jobhazards.find(params[:id])
      @jobhazard_file = @jobhazard.jobhazards_files.where("jobhazard_id = ?", params[:id])
      @jobhazard_file.each do |iFile|
        iFile.file = iFile.file.thumb
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jobhazard_params
      params.require(:jobhazard).permit(:sow, :criticalsteps, :situations, :worsthappen, :defenses, :project_id,:file)
    end

    def remove_empty_jobhazard
      Jobhazard.destroy_all(sow: nil)
    end
end
