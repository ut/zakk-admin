json.extract! content, :id, :title, :text, :published, :pos, :col, :page_id, :created_at, :updated_at
json.url content_url(content, format: :json)