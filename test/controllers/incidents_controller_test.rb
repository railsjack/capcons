require 'test_helper'

class IncidentsControllerTest < ActionController::TestCase
  setup do
    @incident = incidents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:incidents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create incident" do
    assert_difference('Incident.count') do
      post :create, incident: { circumstances: @incident.circumstances, event_discription: @incident.event_discription, injuries_type: @incident.injuries_type, injury_date: @incident.injury_date, injury_time: @incident.injury_time, job_title: @incident.job_title, location: @incident.location, medical_assistance_provided: @incident.medical_assistance_provided, ppe_used: @incident.ppe_used, report_type: @incident.report_type, witnesses: @incident.witnesses, your_name: @incident.your_name }
    end

    assert_redirected_to incident_path(assigns(:incident))
  end

  test "should show incident" do
    get :show, id: @incident
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @incident
    assert_response :success
  end

  test "should update incident" do
    patch :update, id: @incident, incident: { circumstances: @incident.circumstances, event_discription: @incident.event_discription, injuries_type: @incident.injuries_type, injury_date: @incident.injury_date, injury_time: @incident.injury_time, job_title: @incident.job_title, location: @incident.location, medical_assistance_provided: @incident.medical_assistance_provided, ppe_used: @incident.ppe_used, report_type: @incident.report_type, witnesses: @incident.witnesses, your_name: @incident.your_name }
    assert_redirected_to incident_path(assigns(:incident))
  end

  test "should destroy incident" do
    assert_difference('Incident.count', -1) do
      delete :destroy, id: @incident
    end

    assert_redirected_to incidents_path
  end
end
