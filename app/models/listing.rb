class Listing < ApplicationRecord
	include Filterable

	belongs_to :user
	has_many :reservations

	mount_uploaders :galleries, GalleryUploader

	def verify!
  		update_attribute(:verification, true)
 	end

 	scope :city_search, -> (city_search) { where "area = ?", city_search }
 	scope :bedrooms_search, -> (bedrooms_search) { where "bedrooms_num = ?", bedrooms_search }
 	scope :bathrooms_search, -> (bathrooms_search) { where "bathrooms_num = ?", bathrooms_search }
 	scope :price_range, -> (min_price, max_price) { where "price > ? AND price < ?", min_price, max_price }

end


