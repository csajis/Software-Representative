json.extract! moderation, :id, :admin_id, :votation_id, :created_at, :updated_at
json.url moderation_url(moderation, format: :json)
