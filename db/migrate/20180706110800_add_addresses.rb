class AddAddresses < ActiveRecord::Migration[5.2]
  def change

      add_column :listings, :country, :string
      add_column :listings, :state, :string
      add_column :listings, :city, :string
      add_column :listings, :zipcode, :string
      
  end
end