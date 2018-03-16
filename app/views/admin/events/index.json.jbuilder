json.array!(@events) do |event|
  json.extract! event, :id, :title, :shortext, :longtext, :startdate, :enddate, :location_id, :link, :label, :organizer, :organizerlink
  json.url event_url(event, format: :json)
end
