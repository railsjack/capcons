class JobhazardsFilesController < ApplicationController
  before_action :set_jobhazards_file, only: [:show, :edit, :update, :destroy]
  before_action :set_jobhazard, only: [:show]

  def create
    @jobhazard = Jobhazard.find(params[:jobhazard_id])
    @jobhazards_file = @jobhazard.jobhazards_files.build(jobhazards_file_params)
    @jobhazards_file.file = uploaded_picture(params[:file]) if params[:file].present?

    @jobhazards_file.save!
    #respond_with(@jobhazards_file)
    return render :json=>{url: @jobhazards_file.file.thumb.url}
  end

  def upload_image
    jobhazard = Jobhazard.find(params[:id])

    jobhazards_file = jobhazard.jobhazards_files.build(jobhazards_file_params)
    jobhazards_file.file = uploaded_picture(params[:file]) if params[:file].present?
    jobhazards_file.save!

    return render :json=>{url: jobhazards_file.file.thumb.url}
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

    def jobhazards_file_params
      params.require(:jobhazards_file).permit(:jobhazard_id, :file)
    end
end
