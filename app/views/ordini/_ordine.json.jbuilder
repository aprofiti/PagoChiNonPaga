json.extract! ordine, :id, :data, :stato, :created_at, :updated_at
json.url ordine_url(ordine, format: :json)