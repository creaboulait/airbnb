class Listing < ApplicationRecord
	belongs_to :user

	mount_uploaders :galleries, GalleryUploader

	def verify!
  		update_attribute(:verification, true)
 	end


end

