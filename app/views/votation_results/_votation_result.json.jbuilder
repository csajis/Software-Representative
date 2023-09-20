json.extract! votation_result, :id, :votation_id, :final_result, :created_at, :updated_at
json.url votation_result_url(votation_result, format: :json)
