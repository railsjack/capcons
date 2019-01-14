json.array!(@incidents) do |incident|
  json.extract! incident, :id, :report_type, :your_name, :job_title, :injury_date, :injury_time, :witnesses, :location, :circumstances, :event_discription, :injuries_type, :ppe_used, :medical_assistance_provided
  json.url project_incident_url(@project ,incident, format: :json)
end
