class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.includes(:generation)
  end
  # @pokemons shared with app/views/pokemons/index

  def show
    @pokemon = Pokemon.find(params[:id])
  end
  # @pokemon shared with app/views/pokemons/show
end
