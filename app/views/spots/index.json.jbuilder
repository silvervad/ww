json.array!(@spots) do |spot|
  json.extract! spot, :id, :name, :latitude, :longitude
  json.url spot_url(spot, format: :json)
end
