json.array!(@checks) do |check|
  json.extract! check, :employee_id, :check_in, :check_out
  json.url check_url(check, format: :json)
end
