class RestaurantsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy ]

	def index
		@restaurants = Restaurant.all
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		
		@restaurant = current_user.restaurants.create(restaurant_params)
		

		if @restaurant.valid?
    		redirect_to restaurants_path
  		else
    		render :new, status: :unprocessable_entity
  		end
  		
	end

	def show
		@restaurant = Restaurant.find(params[:id])
		@comment = Comment.new
	end

	def edit
		@restaurant = Restaurant.find(params[:id])

		if @restaurant.user != current_user
    		return render text: 'Not Allowed -- I\'m Sorry, you don\'t have permission to edit' , status: :forbidden
 		end
	end

	def update
		@restaurant = Restaurant.find(params[:id])
		if @restaurant.user != current_user
    		return render text: 'Not Allowed -- I\'m sorry, you don\'t have permission to update', status: :forbidden
  		end

		@restaurant.update_attributes(restaurant_params)
		redirect_to restaurants_path
	end

	def destroy
		@restaurant = Restaurant.find(params[:id])
		if @restaurant.user != current_user
    		return render text: 'Not Allowed -- I\'m sorry, you don\'t have permission to delete this restaurant record', status: :forbidden
  		end

		@restaurant.destroy
		redirect_to restaurants_path
	end

	private

	def restaurant_params
		params.require(:restaurant).permit(:name, :description, :address, :restaurant_image)
	end


end
