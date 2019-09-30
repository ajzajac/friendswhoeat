json.extract! follow, :id, :follower_id, :followee_id, :created_at, :updated_at
json.url follow_url(follow, format: :json)
