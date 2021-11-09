class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index

    @restaurants = Restaurant.all
  end

  def show
     
  end

  def new
    @restaurant = Restaurant.new()
  end

  def create
    # raise
    # @restaurant = Restaurant.create(
    #   name: params[:restaurant][:name],
    #   address: params[:restaurant][:address],
    #   rating: params[:restaurant][:rating].to_i,
    # )

    # @restaurant.save

    @restaurant = Restaurant.create(restaurant_params)

    redirect_to restaurant_path(@restaurant)

  end

  def edit
    
  end

  def update
    
    @restaurant.update(restaurant_params)    
    # @restaurant = Restaurant.create(restaurant_params)

    redirect_to restaurant_path(@restaurant)
  end


  def destroy
    
    @restaurant.destroy

    redirect_to restaurants_path
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :rating, :address)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])    
  end
end
