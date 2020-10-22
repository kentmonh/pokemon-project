class AbilitiesController < ApplicationController
  def index
    @abilities = Ability.all
  end

  def show; end
end
