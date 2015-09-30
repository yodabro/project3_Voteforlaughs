json.array!(@comedians) do |comedian|
  json.extract! comedian, :id, :username, :email, :password_digest, :location, :photo, :bio, :twitter, :facebook, :instagram, :youtube
  json.url comedian_url(comedian, format: :json)
end
