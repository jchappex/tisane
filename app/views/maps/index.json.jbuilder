json.array!(@maps) do |map|
  json.extract! map, :id, :latitude, :longitude, :address, :description, :title
  json.url map_url(map, format: :json)
end
