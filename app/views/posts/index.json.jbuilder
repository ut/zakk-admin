json.array!(@posts) do |post|
  json.extract! post, :id, :title, :shortext, :longtext, :startdate, :enddate, :location_id, :link, :label, :organizer, :organizerlink
  json.url post_url(post, format: :json)
end
