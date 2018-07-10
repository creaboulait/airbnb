class Reservation < ApplicationRecord
	belongs_to :user
	belongs_to :listing

	# validate :overlapping

	# private
	
	# def overlapping
 #    if Reservation.where('? <  end_date and ? > start_date', self.start_date, self.end_date).any?
 #        errors.add(:end_date, 'Your chosen dates are not available.')
 #    end
end
