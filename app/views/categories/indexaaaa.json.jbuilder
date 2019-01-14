json.array!(@category) do |cat|
  json.extract! cat, :id, :name
end