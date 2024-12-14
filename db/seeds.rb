# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   [Action, Comedy, Drama, Horror].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Producto.destroy_all

Producto.create!([
    {
    name:"Tee",
    description: "Add to your wardrobe a simple and super soft basic T-shirt made from natural materials only. This T-shirt is made of 100% organic cotton jersey that feels silky smooth against the skin. Designed in a regular fit and completed with a rounded neckline.

    Color: Bright White
    
    Quality: 100% Organic Cotton
    
    Style no.: 1010113-1010",
    size:"Large",
    color:"White",
    ventas_id:1
    category: "",
    unit_price: 20,
    stock: 20
},
{
    name:"Shoes",
    size:"Medium",
    description:"Round toe. Faux leather. Laces with metallic eyelets.",
    color:"Black",
    ventas_id:2
    category: "",
    unit_price: 12,
    stock: 10,

},
{
    name:"Joggins",
    size:"Medium",
    description:"Joggins tipo babucha corte Regular con bolsillos ojal , cordón para ajustar la cintura y puños. Modelo: Talle M ( pesa 68kg mide 1,75 alto )",
    color:"Yellow",
    ventas_id:189
    category: "",
    unit_price: 43,
    stock: 5,
}])

p "Created #{Producto.count} productos"


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