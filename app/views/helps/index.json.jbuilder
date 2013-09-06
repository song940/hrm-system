json.array!(@helps) do |help|
  json.extract! help, :title, :content
  json.url help_url(help, format: :json)
end
