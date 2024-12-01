json.extract! producto, :id, :name, :descripcion, :images, :unit_price, :stock, :category, :size, :color, :date_in_stock, :last_update, :delete_date, :created_at, :updated_at
json.url producto_url(producto, format: :json)
json.descripcion producto.descripcion.to_s
json.images do
  json.array!(producto.images) do |image|
    json.id image.id
    json.url url_for(image)
  end
end
