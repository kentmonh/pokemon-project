class Pokemon < ApplicationRecord
  belongs_to :generation

  has_many :pokemon_types
  has_many :types, through: :pokemon_types

  has_many :pokemon_abilities
  has_many :abilities, through: :pokemon_abilities

  validates :name, :total_point, presence: true
  validates :name, uniqueness: true
  validates :total_point, numericality: { only_integer: true }
  validates :height, :weight, numericality: true

  def types_list
    types.map(&:name).join(", ")
  end
end
