class FixColumnNameListings < ActiveRecord::Migration[5.2]
  def change
  	rename_column :listings, :photo, :gallery
  end
end
