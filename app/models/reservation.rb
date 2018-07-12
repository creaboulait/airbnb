class Reservation < ApplicationRecord
	belongs_to :user
	belongs_to :listing

	# validate :overlapping
	validate :check_dates
	validates_presence_of :start_date, :end_date
    validate :end_date_is_after_start_date
	validate :overlapping_reservations

	# Checks if the booking start date is in the past
    def check_dates
        if start_date.present? && start_date < Date.today
            errors.add(:check_in_date, message:"This date can't be in the past!")
        end
    end

    def end_date_is_after_start_date
        return if end_date.blank? || start_date.blank?

        if end_date < start_date
        errors.add(:end_date, "cannot be before the start date") 
        end 
    end

    # Check if a given reservation overlaps this interval
    def overlapping_reservations
        
        Reservation.where("listing_id = ?", self.listing_id).where.not(id: self.id).each do |r|
            if overlaps?(r)
                return errors.add(:overlapping_dates, message:"These dates are unavailable.")
            end
        end
    end

   
    private    
    # Checks if a given reservation overlaps this reservation    
    def overlaps?(other)
        self.start_date <= other.end_date && other.start_date <= self.end_date
    end

	# private
	
	# def overlapping
 #    	if Reservation.where('? <  end_date AND ? > start_date', self.start_date, self.end_date).any?
 #    	    errors.add(:end_date, 'Your chosen dates are not available.')
 #    	end
	# end
end
