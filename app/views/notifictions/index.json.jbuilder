json.array!(@notifictions) do |notifiction|
  json.extract! notifiction, :user_id, :msg, :unread, :sender
  json.url notifiction_url(notifiction, format: :json)
end
