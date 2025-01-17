json.extract! purchase, :id, :fecha_venta, :cantidad, :precio_unitario, :precio_total_venta, :user_id, :producto_id, :nombre_cliente, :created_at, :updated_at
json.url purchase_url(purchase, format: :json)
