json.array!(@jobhazards) do |jobhazard|
  json.extract! jobhazard, :id, :sow, :criticalsteps, :situations, :worsthappen, :defenses
  json.url project_jobhazard_url(@project ,jobhazard, format: :json)
end
