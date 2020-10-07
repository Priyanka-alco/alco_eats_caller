json.extract! state, :id, :state_name, :country_id, :status, :created_at, :updated_at
json.url state_url(state, format: :json)
