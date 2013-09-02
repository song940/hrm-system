json.array!(@attachments) do |attachment|
  json.extract! attachment, :employee_id, :name, :describe
  json.url attachment_url(attachment, format: :json)
end
