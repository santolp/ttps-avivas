class AddDeletedAtToPurchase < ActiveRecord::Migration[8.0]
  def change
    add_column :purchases, :deleted_at, :datetime
    add_index :purchases, :deleted_at
  end
end
