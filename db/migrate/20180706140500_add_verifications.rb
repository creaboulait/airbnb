class AddVerifications < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :verification, :boolean, :default => false
  end
end