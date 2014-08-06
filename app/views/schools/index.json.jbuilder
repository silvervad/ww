json.array!(@schools) do |school|
  json.extract! school, :id, :spot_id, :sports, :name, :latitude, :longitude, :link, :affiliation
  json.url school_url(school, format: :json)
end
