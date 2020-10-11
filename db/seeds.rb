require "csv"

# Clearing our data
Pokemon.destroy_all
Generation.destroy_all

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
end

puts "Created #{Generation.count} generations"
puts "Created #{Pokemon.count} pokemons"
