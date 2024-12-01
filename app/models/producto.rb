class Producto < ApplicationRecord
  has_rich_text :descripcion
  has_many_attached :images
end
