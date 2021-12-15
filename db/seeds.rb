# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Drink.create!(name: "Monster", description: "75mg Per serving. Every can has 2 servings.", caffeine: 150)
Drink.create!(name: "Black Coffee", description: "95mg Caffeine per serving.", caffeine: 95)
Drink.create!(name: "Americano", description: "77mg Caffeine per serving.", caffeine: 77)
Drink.create!(name: "NOS", description: "130mg Per serving. Every can has 2 servings.", caffeine: 260)
Drink.create!(name: "5 Hour Energy", description: "200Mg per serving.", caffeine: 200)