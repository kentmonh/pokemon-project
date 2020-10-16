class Ability < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
