class AnswersFilesController < ApplicationController
  before_action :set_answers_file, only: [:show, :edit, :update, :destroy]
  before_action :set_answer, only: [:show]

  def create
    @answer = Answer.find(params[:answer_id])
    @answers_file = @answer.answers_files.build(answers_file_params)
    @answers_file.file = uploaded_picture(params[:file]) if params[:file].present?

    @answers_file.save!
    #respond_with(@answers_file)
    return render :json=>{url: @answers_file.file.thumb.url}
  end

  def upload_image
    answer = Answer.find(params[:id])

    answers_file = answer.answers_files.build(answers_file_params)
    answers_file.file = uploaded_picture(params[:file]) if params[:file].present?
    answers_file.save!

    return render :json=>{url: answers_file.file.thumb.url}
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

    def answers_file_params
      params.require(:answers_file).permit(:answer_id, :file)
    end
end
