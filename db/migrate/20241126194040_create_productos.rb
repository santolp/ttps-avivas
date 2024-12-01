class CreateProductos < ActiveRecord::Migration[8.0]
  def change
    create_table :productos do |t|
      t.string :name
      t.decimal :unit_price
      t.integer :stock
      t.string :category
      t.string :size
      t.string :color
      t.datetime :date_in_stock
      t.datetime :last_update
      t.datetime :delete_date

      t.timestamps
    end
  end
end
