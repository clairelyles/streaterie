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
    if @cuisine.save
      redirect_to cuisines_path
    else
      render 'new'
    end
  end

  def show
    @cuisine = Cuisine.find(params[:id])
    @search = @cuisine.name
    @list = flickr.photos.search :text => @search+" "+"street food", :sort => "relevance"

    # render json:list
    @results = @list.map do |photo|
      FlickRaw.url_q(photo)
    end
  end

  def destroy
    @cuisine = Cuisine.find(params[:id])
    @cuisine.destroy

    redirect_to cuisines_path
  end


end