class Producto < ApplicationRecord
  has_rich_text :description
  has_many_attached :images




  def full_name
    "#{name} - $ #{unit_price}"
  end
end
