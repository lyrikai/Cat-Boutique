# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#   Character.create(name: "Luke", movie: movies.first)

Products.destroy_all


20.times do 

    products = Product.create(title: Faker::Creature::Cat.name, description: Faker::Lorem.paragraph, price: Faker::Number.within(range: 10..100), stock: 50)

end
