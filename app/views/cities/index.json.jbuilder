json.array!(@cities) do |city|
  json.extract! city, :id, :city, :votes
  json.url city_url(city, format: :json)
end
