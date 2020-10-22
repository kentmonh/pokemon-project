require "csv"

# Clearing our data
PokemonType.delete_all
PokemonAbility.delete_all
Type.delete_all
Ability.delete_all
Pokemon.delete_all
Generation.delete_all
Page.delete_all

Page.create(
  title:     "About Page",
  content:   "I am having a plan to build a site contain data of all pokemons.
   I am using 2 data sources, both of them are from Kaggle.
   The first data is an excel file contain information of all pokemons,
   and the second data is collection of photos of these pokemons.
   I will try to appear the photo in each pokemon.
   The data have 4 tables, there are 1 one-to-many relationship is pokemons-generations
   and 2 many-to-many relationships are pokemons-types and pokemons-abilities.",
  permalink: "about_us"
)

# Loop through the rows of a CSV file
csv_file = Rails.root.join("db/pokemon.csv")

csv_data = File.read(csv_file)

pokemons = CSV.parse(csv_data, headers: true, encoding: "utf-8")

pokemons.each do |pokemon|
  generation = Generation.find_or_create_by(number: pokemon["generation"])

  next unless generation&.valid?

  p = generation.pokemons.create(
    name:        pokemon["name"],
    total_point: pokemon["total_points"],
    height:      pokemon["height_m"],
    weight:      pokemon["weight_kg"]
  )

  types = pokemon["types"].split(",").map(&:strip)
  types.each do |type_name|
    type = Type.find_or_create_by(name: type_name)
    PokemonType.create(pokemon: p, type: type)
  end

  abilities = pokemon["abilities"].split(",").map(&:strip)
  abilities.each do |ability_name|
    ability = Ability.find_or_create_by(name: ability_name)
    PokemonAbility.create(pokemon: p, ability: ability)
  end
end

puts "Created #{Generation.count} generations"
puts "Created #{Pokemon.count} pokemons"
puts "Created #{Type.count} types"
puts "Created #{PokemonType.count} pokemon types"
puts "Created #{Ability.count} abilities"
puts "Created #{PokemonAbility.count} pokemon abilities"
