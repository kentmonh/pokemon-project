class HomeController < ApplicationController
  def index
    @pokemons = Pokemon.includes(:generation).limit(10)

    @generations = Generation.all
  end
end
