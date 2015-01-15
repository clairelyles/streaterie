class CuisinesController < ApplicationController

  before_action :is_authenticated?

  def index
    @cuisines = Cuisine.all
    # render json:@photo
    # flash[:notice] = "Welcome to the page"
  end

  def new
    @cuisine = Cuisine.new
    @tags = Tag.all
  end

  def create
    @cuisine = Cuisine.new(cuisine_params)
    @tags = Tag.all
    list = flickr.photos.search :text => @cuisine.name+' '+'street food', :sort => 'relevance'
    @cuisine.url = FlickRaw.url_q(list[0])

    if @cuisine.save
      @cuisine.tags.clear
      tags = params[:cuisine][:tag_ids]

      tags.each do |tag|
        @cuisine.tags << Tag.find(tag) unless tag.blank?
      end

      flash[:success] = "Your cuisine has been added"
      redirect_to cuisines_path
    else
      # flash is a variable and you are adding a value "string" to it
      flash[:notice] = "Unable to create new Cuisine"
      render :new
    end
  end

  def update
    @cuisine = Cuisine.find(params[:id])
    @cuisine.tags.clear
    tags = params[:cuisine][:tag_ids]

    tags.each do |tag|
      @cuisine.tags << Tag.find(tag) unless tag.blank?
    end

    if @cuisine.update(cuisine_params)
      redirect_to @cuisine
    else
      render 'edit'
    end
  end

  def edit
    @cuisine = Cuisine.find(params[:id])
    @tags = Tag.all
  end

  def show
    @cuisine = Cuisine.find_by_id(params[:id])
    @tags = @cuisine.tags.map do |tag|
              tag.name+" "
            end
    not_found unless @cuisine

    @search = @cuisine.name
    @list = flickr.photos.search :text => @search+' '+'street food', :sort => 'relevance'
    # render json:list

    @results = @list.map do |photo|
      [FlickRaw.url_q(photo),
      FlickRaw.url_c(photo)]
    end

  end

  def destroy
    @cuisine = Cuisine.find_by_id(params[:id])
    @cuisine.destroy

    redirect_to cuisines_path
  end

  # searching for a specific tag
  def tag
      tag = Tag.find_by_name(params[:tag])
      @cuisines = tag ? tag.cuisines : []
  end

  private

  def tag_params
    # params.require(:cuisine).permit(:tag_ids)
  end

  def cuisine_params
    params.require(:cuisine).permit(:name, :recipe)
  end

end