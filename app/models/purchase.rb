class Purchase < ApplicationRecord
  acts_as_paranoid

  belongs_to :producto
  belongs_to :user

  after_destroy :restore_stock

  private

  def restore_stock
    producto.increment!(:stock, cantidad)
  end
end
