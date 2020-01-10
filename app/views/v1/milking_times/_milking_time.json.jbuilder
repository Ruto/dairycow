json.extract! milking_time, :id, :milking_timeable_id, :milking_timeable_type, :first_milking, :second_milking, :third_milking, :fourth_milking, :milking_count, :active, :created_by, :deactivated_by, :created_at, :updated_at
json.url v1_milking_time_url(milking_time, format: :json)
