class Generation < ApplicationRecord
  has_many :pokemons
  validates :number, presence: true, uniqueness: true

  def self.pokemon_count
    self.select("generations.*")
        .select("COUNT(generations.id) as pokemon_count")
        .left_joins(:pokemons)
        .group("generations.id")
  end
end
