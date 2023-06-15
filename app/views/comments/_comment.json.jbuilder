json.extract! comment, :id, :user_id, :post_id, :text, :created_at, :updated_at
json.url comment_url(comment, format: :json)
