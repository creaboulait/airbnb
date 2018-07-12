class ReservationMailer < ApplicationMailer
	default from: 'notifications@example.com'

  def reservation_email(customer, host, reservation_id)
    @customer = customer #will have user.id
    @host = host #will have user.id
    @reservation_id = reservation_id #will take values of reservation.id 
    @url  = 'http://localhost:3000//listings/#{@reservation.listing.id}/reservations'
    mail(to: 'testing.norshida@gmail.com', subject: 'Your place has been booked!')
  end
end
