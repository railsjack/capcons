json.array!(@questions) do |ques|
  json.extract! ques, :id, :body, :category_id
end
