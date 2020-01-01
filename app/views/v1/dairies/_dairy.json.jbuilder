json.extract! dairy, :id, :name, :desc, :user_id, :active, :country, :county, :geolocation_id, :created_at, :updated_at
json.url v1_dairy_url(dairy, format: :json)
