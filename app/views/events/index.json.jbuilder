json.array!(@events) do |event|
  json.extract! event, :id, :date, :time, :location, :venue, :lineup, :tickets_link
  json.url event_url(event, format: :json)
end
