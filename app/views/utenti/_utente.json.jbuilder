json.extract! utente, :id, :nome, :cognome, :cf, :data_nascita, :telefono, :created_at, :updated_at
json.url utente_url(utente, format: :json)