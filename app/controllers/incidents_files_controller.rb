class IncidentsFilesController < ApplicationController
  before_action :set_incidents_file, only: [:show, :edit, :update, :destroy]
  before_action :set_incident, only: [:show]

  def create
    @incident = Incident.find(params[:incident_id])
    @incidents_file = @incident.incidents_files.build(incidents_file_params)
    @incidents_file.file = uploaded_picture(params[:file]) if params[:file].present?

    @incidents_file.save!
    #respond_with(@incidents_file)
    return render :json=>{url: @incidents_file.file.thumb.url}
  end

  def upload_image
    incident = Incident.find(params[:id])

    incidents_file = incident.incidents_files.build(incidents_file_params)
    incidents_file.file = uploaded_picture(params[:file]) if params[:file].present?
    incidents_file.save!

    return render :json=>{url: incidents_file.file.thumb.url}
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

    def incidents_file_params
      params.require(:incidents_file).permit(:incident_id, :file)
    end

end
