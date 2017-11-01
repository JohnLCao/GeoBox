json.extract! document, :id, :filename, :description, :latitude, :longitude, :cloudKey, :user, :created_at, :updated_at
json.url document_url(document, format: :json)
