class ReservationJob < ApplicationJob
  queue_as :default

  def perform(reservation)
    # Do something later
    ReservationMailer.reservation_email(reservation.user.email, reservation.listing.user.email, reservation.id).deliver_later
  end
end
