json.array!(@locations) do |location|
  json.extract! location, :id, :title, :address, :zipcode, :city, :email, :web, :twitter, :lat, :lon, :shortext, :longtext
  json.url location_url(location, format: :json)
end
