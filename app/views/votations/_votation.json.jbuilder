# frozen_string_literal: true

json.extract! votation, :id, :name, :description, :enabled, :created_at, :updated_at
json.url votation_url(votation, format: :json)
