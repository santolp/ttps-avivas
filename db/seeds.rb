# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   [Action, Comedy, Drama, Horror].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


#Importamos la gema faker para generar datos aleatorios
require 'faker'


#Eliminamos todo lo que haya
User.destroy_all
Producto.destroy_all
Purchase.destroy_all

#Creamos los user de pruebas
admin = User.create!(
  email: "admin@avivas.com",
  username: "admin_user",
  phone: "1123456789",
  password: "admin123",
  role: :admin
)

gerente = User.create!(
  email: "gerente@avivas.com",
  username: "gerente_user",
  phone: "1145678910",
  password: "gerente123",
  role: :gerente
)

empleado = User.create!(
  email: "empleado@avivas.com",
  username: "empleado_user",
  phone: "1178901234",
  password: "empleado123",
  role: :empleado
)


#Creamos Productos
productos = []
10.times do
  productos << Producto.create!(
    name: Faker::Commerce.product_name,
    unit_price: Faker::Commerce.price(range: 1000.0..10000.0),
    stock: rand(50..200),
    category: Faker::Commerce.department(max: 1),
    size: ["S", "M", "L", "XL"].sample,
    color: Faker::Color.color_name,
    date_in_stock: Faker::Date.backward(days: 60),
    last_update: Faker::Date.backward(days: 10),
    description: Faker::Lorem.sentence(word_count: 10)
  )
end

20.times do
  producto = productos.sample
  cantidad = rand(1..5)
  precio_unitario = producto.unit_price
  precio_total_venta = cantidad * precio_unitario
  nombre_cliente = Faker::Name.first_name + " " + Faker::Name.last_name

  #Creamos Ventas(Purchase)
  Purchase.create!(
    fecha_venta: Faker::Date.backward(days: 30),
    cantidad: cantidad,
    precio_unitario: precio_unitario,
    precio_total_venta: precio_total_venta,
    user_id: [admin, gerente, empleado].sample.id,
    producto_id: producto.id,
    nombre_cliente: nombre_cliente
  )

  producto.update!(stock: producto.stock - cantidad)
end


##
#Primero, destruye todas las películas para tener un estado limpio y agrega tres películas pasando una matriz al método de creación. Esas prácticas instrucciones Ruby X.ago para definir fechas las proporcionan las extensiones principales de Active Support.

#Al final, hay algunos comentarios sobre la cantidad total de películas creadas. ¡Ejecutémoslo!
# bin/rails db:seed
# "Created 3 productos"


# Puedes ejecutar este comando tantas veces como necesites, ya que los registros existentes se eliminan gracias a la primera línea que contiene la sentencia destroy.

# Para comprobarlos, puedes utilizar rails runner:

# bin/rails runner "p Producto.pluck :name"
# # ["Tee", "Shoes", "Joggins"]

##