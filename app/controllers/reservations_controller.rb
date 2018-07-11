class ReservationsController < ApplicationController

	def index
		@reservation = Reservation.page(params[:page]).per(10)
		render 'users/show.html.erb'
		#shows all reservations belonging to user on profile page
	end

	def new
		@listing = Listing.find(params[:listing_id])
		@reservation = Reservation.new
	end

	def create
		@reservation = Reservation.new(reservation_params)
		@reservation.user_id = current_user.id
		@reservation.total = (@reservation.end_date - @reservation.start_date) * @reservation.price
		
		@reservation.save
		redirect_to root_path, notice: "Your reservation has been successful."
	end

	def destroy
		byebug
		@listing = Listing.find(params[:listing_id])
		@reservation = Reservation.find(params[:reservation_id])
  		@reservation.destroy

  		redirect_to root_path
	end



private
	def reservation_params
		params.require(:reservation).permit(:start_date, :end_date, :listing_id, :price, :total)
	end
end

