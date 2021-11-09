class RestaurantsController < ApplicationController
  def index

    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id]) 
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
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)    
    # @restaurant = Restaurant.create(restaurant_params)

    redirect_to restaurant_path(@restaurant)
  end


  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    redirect_to restaurants_path
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :rating, :address)
  end
end
