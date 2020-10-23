class AbilitiesController < ApplicationController
  def index
    @abilities = Ability.all.page(params[:page])
  end

  def show; end
end
