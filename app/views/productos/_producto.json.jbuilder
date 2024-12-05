json.extract! producto, :id, :name, :description, :images, :unit_price, :stock, :category, :size, :color, :date_in_stock, :last_update, :delete_date, :created_at, :updated_at
json.url producto_url(producto, format: :json)
json.description producto.description.to_s
json.images do
  json.array!(producto.images) do |image|
    json.id image.id
    json.url url_for(image)
  end
end
