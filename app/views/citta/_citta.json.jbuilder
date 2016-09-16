json.extract! citta, :id, :nome, :provincia, :regione, :created_at, :updated_at
json.url citta_url(citta, format: :json)