json.extract! milking_schedule, :id, :cow_id, :first_milking, :second_milking, :third_milking, :fourth_milking, :milking_count, :created_at, :updated_at
json.url v1_milking_schedule_url(milking_schedule, format: :json)
