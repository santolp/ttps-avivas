class DropVentas < ActiveRecord::Migration[8.0]
  def change
    drop_table :ventas
  end
end
