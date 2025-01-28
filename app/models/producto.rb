class Producto < ApplicationRecord
  has_rich_text :description
  has_many_attached :images
  validates :stock, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  def decrement_stock!(cantidad)    
      update!(stock: stock - cantidad)    
  end


  def product_list
    Producto.all
  end 

  def full_name
    "#{name} - $ #{unit_price}"
  end
end
