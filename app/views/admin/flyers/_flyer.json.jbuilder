json.extract! flyer, :id, :image, :title, :created_at, :updated_at
json.url flyer_url(flyer, format: :json)