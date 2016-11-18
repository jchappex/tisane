json.array!(@products) do |product|
  json.extract! product, :id, :title, :nomlatin, :provenance, :proprietes, :description, :image_url, :price, :product_line
  json.url product_url(product, format: :json)
end
