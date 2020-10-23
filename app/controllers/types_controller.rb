class TypesController < ApplicationController
  def index
    @types = Type.all.page(params[:page])
  end

  def show; end
end
