json.array!(@answers_files) do |answers_file|
  json.extract! answers_file, :id, :answer_id, :file
  json.url answers_file_url(answers_file, format: :json)
end
