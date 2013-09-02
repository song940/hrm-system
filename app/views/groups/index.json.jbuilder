json.array!(@groups) do |group|
  json.extract! group, :group_id, :employee_id, :name
  json.url group_url(group, format: :json)
end
