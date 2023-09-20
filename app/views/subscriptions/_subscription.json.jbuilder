json.extract! subscription, :id, :voter_id, :votation_id, :created_at, :updated_at
json.url subscription_url(subscription, format: :json)
