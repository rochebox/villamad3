class Restaurant < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	
	validates :name, presence: true
	mount_uploader :restaurant_image, RestaurantImageUploader
end
