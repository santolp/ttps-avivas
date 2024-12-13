class AddUserToRoles < ActiveRecord::Migration[8.0]
  def change
    add_reference :roles, :user, null: false, foreign_key: true
  end
end
