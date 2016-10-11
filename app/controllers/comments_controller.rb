class CommentsController < ApplicationController
	before_action :authenticate_user!
	def create
		@restaurant= Restaurant.find(params[:restaurant_id])
		@restaurant.comments.create(comment_params.merge(user: current_user))
		redirect_to restaurant_path(@restaurant)
	end

	private

	def comment_params
		params.require(:comment).permit(:message, :rating)
	end
end
