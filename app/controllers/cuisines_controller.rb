class CuisinesController < ApplicationController

  def index
    @cuisines = Cuisine.all
  end

  def new
    @cuisine = Cuisine.new
  end

  def create
    # render json:params

    @cuisine = Cuisine.new
    @cuisine.name = params[:cuisine][:name]
    @cuisine.recipe = params[:cuisine][:recipe]
    @cuisine.save
    redirect_to cuisines_path
  end

  def show

  end

end