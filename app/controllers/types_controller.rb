class TypesController < ApplicationController
  def index
    @types = Type.all.page(params[:page])
  end

  def show
    @type = Type.find(params[:id])
  end
end
