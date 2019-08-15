json.extract! giphy, :id, :image, :title, :created_at, :updated_at
json.url giphy_url(giphy, format: :json)
