json.array!(@performances) do |performance|
  json.extract! performance, :employee_id, :number, :reason
  json.url performance_url(performance, format: :json)
end
