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

  def edit
    @cuisine = Cuisine.find(params[:id])
  end

  def update
    @cuisine = Cuisine.find(params[:id])

    if @cuisine.update(cuisine_params)
      redirect_to @cuisine
    else
      render 'edit'
    end
  end

  def cuisine_params
    params.require(:cuisine).permit(:name, :recipe)
  end

  def show
    @cuisine = Cuisine.find(params[:id])
    @search = @cuisine.name
    @list = flickr.photos.search :text => @search+" "+"street food", :sort => "relevance"
    # render json:list

    @results = @list.map do |photo|
      [FlickRaw.url_q(photo),
      FlickRaw.url_c(photo)]
    end
  end

  def destroy
    @cuisine = Cuisine.find(params[:id])
    @cuisine.destroy

    redirect_to cuisines_path
  end


end