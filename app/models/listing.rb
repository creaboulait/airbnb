class Listing < ApplicationRecord
	belongs_to :user
	has_many :reservations

	mount_uploaders :galleries, GalleryUploader

	def verify!
  		update_attribute(:verification, true)
 	end


end

