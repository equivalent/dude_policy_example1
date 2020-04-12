json.extract! article, :id, :title, :body, :author_id, :secret_note, :created_at, :updated_at
json.url article_url(article, format: :json)
