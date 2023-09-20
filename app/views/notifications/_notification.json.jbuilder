json.extract! notification, :id, :content, :created_at, :updated_at
json.url notification_url(notification, format: :json)
