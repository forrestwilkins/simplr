json.extract! picture, :id, :image_data, :created_at, :updated_at
json.url picutre_url(picture, format: :json)
json.image_url picture.image_url
