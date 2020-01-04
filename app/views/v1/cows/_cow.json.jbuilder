json.extract! cow, :id, :name, :dob, :breed, :female, :created_by, :dairy_id, :birth_by, :photo_id, :active, :deactivation_reason, :created_at, :updated_at
json.url v1_cow_url(cow, format: :json)
