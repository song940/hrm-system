json.array!(@logs) do |log|
  json.extract! log, :user_id, :level, :tag, :msg
  json.url log_url(log, format: :json)
end
