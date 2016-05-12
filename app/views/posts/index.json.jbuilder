json.array!(@posts) do |post|
  json.extract! post, :id, :title, :desc, :category_id, :approved_at
  json.url post_url(post, format: :json)
end
