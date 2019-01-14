require 'test_helper'

class AnswersFilesControllerTest < ActionController::TestCase
  setup do
    @answers_file = answers_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:answers_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create answers_file" do
    assert_difference('AnswersFile.count') do
      post :create, answers_file: { answer_id: @answers_file.answer_id, file: @answers_file.file }
    end

    assert_redirected_to answers_file_path(assigns(:answers_file))
  end

  test "should show answers_file" do
    get :show, id: @answers_file
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @answers_file
    assert_response :success
  end

  test "should update answers_file" do
    patch :update, id: @answers_file, answers_file: { answer_id: @answers_file.answer_id, file: @answers_file.file }
    assert_redirected_to answers_file_path(assigns(:answers_file))
  end

  test "should destroy answers_file" do
    assert_difference('AnswersFile.count', -1) do
      delete :destroy, id: @answers_file
    end

    assert_redirected_to answers_files_path
  end
end
