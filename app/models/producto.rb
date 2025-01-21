class Producto < ApplicationRecord
  has_rich_text :description
  has_many_attached :images



  def product_list
    Producto.all
  end 

  def full_name
    "#{name} - $ #{unit_price}"
  end
end
