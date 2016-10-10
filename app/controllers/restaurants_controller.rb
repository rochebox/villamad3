class RestaurantsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create ]

	def index
		@restaurants = Restaurant.all
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		
		current_user.restaurants.create(restaurant_params)
		redirect_to restaurants_path
	end

	def show
		@restaurant = Restaurant.find(params[:id])
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def update
		@restaurant = Restaurant.find(params[:id])
		@restaurant.update_attributes(restaurant_params)
		redirect_to restaurants_path
	end

	def destroy
		@restaurant = Restaurant.find(params[:id])
		@restaurant.destroy
		redirect_to restaurants_path
	end

	private

	def restaurant_params
		params.require(:restaurant).permit(:name, :description, :address)
	end


end
