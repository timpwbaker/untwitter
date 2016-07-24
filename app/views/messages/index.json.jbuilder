json.array!(@messages) do |message|
  json.extract! message, :id, :message_body
  json.url message_url(message, format: :json)
end
