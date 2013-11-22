json.array!(@msgs) do |msg|
  json.extract! msg, :sender, :receiver, :unread, :message
  json.url msg_url(msg, format: :json)
end
