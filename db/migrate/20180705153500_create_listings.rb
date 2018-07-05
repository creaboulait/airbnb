
class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|

      t.belongs_to :user
		
	  t.string :description
	  t.string :price
      t.string :area
      t.string :place_type
      t.integer :up_to_guests_num
      t.string :house_type
      t.integer :bedrooms_num
      t.integer :beds_num
      t.integer :bathrooms_num
      t.string :address
      

      t.timestamps
    end
  end
end