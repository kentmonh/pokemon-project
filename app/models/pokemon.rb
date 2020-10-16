class Pokemon < ApplicationRecord
  belongs_to :generation

  has_many :pokemon_types
  has_many :types, through: :pokemon_types

  validates :name, :total_point, presence: true
  validates :name, uniqueness: true
  validates :total_point, numericality: { only_integer: true }
  validates :height, :weight, numericality: true
end
