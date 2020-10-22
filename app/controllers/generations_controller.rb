class GenerationsController < ApplicationController
  def index
    @generations = Generation.pokemon_count
  end

  def show
    @generation = Generation.find(params[:id])
  end
  # Pass @generations and @generation in index and show of views/generations
end
