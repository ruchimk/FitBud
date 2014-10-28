json.array!(@user_activities) do |user_activity|
  json.extract! user_activity, :id, :user_id, :activity_id
  json.url user_activity_url(user_activity, format: :json)
end
