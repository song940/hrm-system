json.array!(@trains) do |train|
  json.extract! train, :name, :employee_id, :keynote, :date, :duration, :address, :must
  json.url train_url(train, format: :json)
end
