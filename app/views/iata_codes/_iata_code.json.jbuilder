json.extract! iata_code, :id, :city, :airport, :code, :created_at, :updated_at
json.url iata_code_url(iata_code, format: :json)
