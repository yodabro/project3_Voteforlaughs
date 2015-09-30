json.array!(@users) do |user|
  json.extract! user, :id, :username, :email, :password_digest, :location, :phone_number, :notify_radius, :comedian_id, :city_id
  json.url user_url(user, format: :json)
end
