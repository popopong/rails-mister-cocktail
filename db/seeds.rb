# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

puts "Cleaning database..."
Ingredient.destroy_all

open_url_ing = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read
ingredients = JSON.parse(open_url_ing)

ingredients["drinks"].each do |ing|
  ingredient = ing["strIngredient1"]
  Ingredient.create(name: ingredient)
end

# open_url_drinks = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read
# drinks = JSON.parse(open_url_drinks)

# drinks["drinks"].each do |details|
  
# end

puts "Created ingredient and cocktail seeds."