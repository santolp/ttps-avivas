class CreateRoles < ActiveRecord::Migration[8.0]
  def change
    create_table :roles do |t|
      t.string :name 
      t.datetime :last_update
      t.datetime :delete_date
      t.timestamps
    end

    create_table :ventas do |t|
      t.string :name
      t.string :producto
      t.datetime :last_update
      t.datetime :delete_date      
      t.timestamps
    end

    add_column :users, :username, :string
    add_column :users, :role_id, :string
    add_column :productos, :ventas_id, :string

   
  end
end
