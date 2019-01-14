json.name = @report.name
json.id = @report.id
json.answers do |json|
	json.array!(@answers) do |ans|
	  json.extract! ans, :id, :question_id, :notes, :file, :status
	end
end