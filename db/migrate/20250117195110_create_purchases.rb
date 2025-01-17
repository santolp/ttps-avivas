class CreatePurchases < ActiveRecord::Migration[8.0]
  def change
    create_table :purchases do |t|
      t.datetime :fecha_venta
      t.integer :cantidad
      t.decimal :precio_unitario
      t.decimal :precio_total_venta
      t.integer :user_id
      t.integer :producto_id
      t.string :nombre_cliente

      t.timestamps
    end
  end
end
