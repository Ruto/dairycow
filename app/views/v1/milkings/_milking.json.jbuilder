json.extract! milking, :id, :cow_id, :type, :quantity, :milking_datetime, :milked_by, :confirmed_by, :user_id, :created_at, :updated_at #:milking_time_id,
json.url v1_milking_url(milking, format: :json)
