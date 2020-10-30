class HomeController < ApplicationController
  def index
    @pokemons = Pokemon.all.limit(10)

    @generations = Generation.all

    @types = Type.all.limit(10)

    @abilities = Ability.all.limit(10)
  end
end
