require 'test_helper'

class IncidentsFilesControllerTest < ActionController::TestCase
  setup do
    @incidents_file = incidents_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:incidents_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create incidents_file" do
    assert_difference('IncidentsFile.count') do
      post :create, incidents_file: { file: @incidents_file.file, id: @incidents_file.id, incident_id: @incidents_file.incident_id }
    end

    assert_redirected_to incidents_file_path(assigns(:incidents_file))
  end

  test "should show incidents_file" do
    get :show, id: @incidents_file
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @incidents_file
    assert_response :success
  end

  test "should update incidents_file" do
    patch :update, id: @incidents_file, incidents_file: { file: @incidents_file.file, id: @incidents_file.id, incident_id: @incidents_file.incident_id }
    assert_redirected_to incidents_file_path(assigns(:incidents_file))
  end

  test "should destroy incidents_file" do
    assert_difference('IncidentsFile.count', -1) do
      delete :destroy, id: @incidents_file
    end

    assert_redirected_to incidents_files_path
  end
end
