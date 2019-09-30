json.extract! restaurant, :id, :name, :cuisine, :location, :rating, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
