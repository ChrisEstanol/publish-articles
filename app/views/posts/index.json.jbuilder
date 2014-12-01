json.array!(@posts) do |post|
  json.extract! post, :id, :title, :author, :published, :content
  json.url post_url(post, format: :json)
end
