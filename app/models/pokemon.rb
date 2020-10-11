class Pokemon < ApplicationRecord
  belongs_to :generation

  validates :name, :total_point, presence: true
  validates :name, uniqueness: true
  validates :total_point, numericality: { only_integer: true }
  validates :height, :weight, numericality: true
end
