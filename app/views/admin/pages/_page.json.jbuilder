json.extract! page, :id, :title, :description, :published, :in_menu, :created_at, :updated_at
json.url page_url(page, format: :json)