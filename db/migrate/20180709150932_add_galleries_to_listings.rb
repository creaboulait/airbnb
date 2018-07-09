class AddGalleriesToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :galleries, :json
    remove_column :listings, :gallery
  end
end
