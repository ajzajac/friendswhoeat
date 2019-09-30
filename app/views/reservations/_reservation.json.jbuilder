json.extract! reservation, :id, :time, :date, :num_of_guests, :restaurant_id, :user_id, :occasion, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
