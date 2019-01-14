json.name = @report.name
json.array!(@categories) do |json,cat|
  json.id cat.id
  json.name cat.name
	json.questions cat.questions do |json, q|
		json.id q.id
		json.body q.body
		json.answer  @answers.where(question_id: q.id) do |json,ans|
			json.status ans.status
			json.notes ans.notes
			json.file ans.file
		end
	end
end

