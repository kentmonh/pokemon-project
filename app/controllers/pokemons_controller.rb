class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.includes(:generation)
  end
  # @pokemons shared with app/views/pokemons/index

  def show
    @pokemon = Pokemon.find(params[:id])
  end
  # @pokemon shared with app/views/pokemons/show

  def search
    keyword_search = "%#{params[:keywords]}%"
    generation_search = params[:select_generation]
    if generation_search == ""
      @result_pokemons = Pokemon.where("name LIKE ?", keyword_search)
    else
      @result_pokemons = Pokemon.where("name LIKE ? AND generation_id = ?", keyword_search, generation_search)
    end
  end
  # @result_pokemons shared with app/views/pokemons/search
end
