class RestaurantsController < ApplicationController

	def index
		@restaurants = Restaurant.all
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		
		restaurant = Restaurant.create(name: params[:name] )
		redirect_to restaurants_path
	end


end
