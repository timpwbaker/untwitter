json.array!(@messages) do |message|
  json.extract! message, :id, :message_body, :publish_date
  json.url message_url(message, format: :json)
end
