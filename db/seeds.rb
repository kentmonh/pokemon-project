require "csv"

# Clearing our data
PokemonType.delete_all
PokemonAbility.delete_all
Type.delete_all
Ability.delete_all
Pokemon.delete_all
Generation.delete_all

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
