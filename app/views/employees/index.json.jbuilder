json.array!(@employees) do |employee|
  json.extract! employee, :name, :gender, :passport
  json.url employee_url(employee, format: :json)
end
