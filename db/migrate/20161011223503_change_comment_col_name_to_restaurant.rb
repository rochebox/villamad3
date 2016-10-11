class ChangeCommentColNameToRestaurant < ActiveRecord::Migration
  def change
  	rename_column :comments, :place_id, :restaurant_id
  end
end
