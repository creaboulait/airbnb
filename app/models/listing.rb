class Listing < ApplicationRecord
	include Filterable

	belongs_to :user
	has_many :reservations

	mount_uploaders :galleries, GalleryUploader

	def verify!
  		update_attribute(:verification, true)
 	end

 	scope :city_search, -> (city_search) { where area: city_search }
 	scope :bedrooms_search, -> (bedrooms_search) { where bedrooms_num: bedrooms_search }
 	scope :bathrooms_search, -> (bathrooms_search) { where bathrooms_num: bathrooms_search }


 # 	def self.search(attribute)
 #  		if attribute
 #    		where('area LIKE ?', "%#{attribute}%") && where('amenities LIKE ?', "%#{attribute}%")
 #  		else
 #    		all
 #  		end
	# end

end


#   scope :status, -> (status) { where status: status }
#   scope :location, -> (location_id) { where location_id: location_id }
#   scope :starts_with, -> (name) { where("name like ?", "#{name}%}
