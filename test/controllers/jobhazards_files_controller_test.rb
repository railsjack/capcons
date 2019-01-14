require 'test_helper'

class JobhazardsFilesControllerTest < ActionController::TestCase
  setup do
    @jobhazards_file = jobhazards_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jobhazards_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create jobhazards_file" do
    assert_difference('JobhazardsFile.count') do
      post :create, jobhazards_file: { file: @jobhazards_file.file, id: @jobhazards_file.id, jobhazard_id: @jobhazards_file.jobhazard_id }
    end

    assert_redirected_to jobhazards_file_path(assigns(:jobhazards_file))
  end

  test "should show jobhazards_file" do
    get :show, id: @jobhazards_file
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @jobhazards_file
    assert_response :success
  end

  test "should update jobhazards_file" do
    patch :update, id: @jobhazards_file, jobhazards_file: { file: @jobhazards_file.file, id: @jobhazards_file.id, jobhazard_id: @jobhazards_file.jobhazard_id }
    assert_redirected_to jobhazards_file_path(assigns(:jobhazards_file))
  end

  test "should destroy jobhazards_file" do
    assert_difference('JobhazardsFile.count', -1) do
      delete :destroy, id: @jobhazards_file
    end

    assert_redirected_to jobhazards_files_path
  end
end
