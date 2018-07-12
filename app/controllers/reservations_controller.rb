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
		
		if @reservation.save
			flash[:success] = "Your reservation is pending payment."

			ReservationMailer.reservation_email(current_user.email, @reservation.listing.user.email, @reservation.id).deliver_now
        	# format.html { redirect_to root_path(@user, notice: 'Reservation was successfully created.') }
			redirect_to new_payment_path(@reservation.id)
		else
			flash[:unavailable] = "#{@reservation.errors.full_messages}"
			redirect_to root_path
		end
	end

	

	def destroy
		
		@listing = Listing.find(params[:listing_id])
		@reservation = Reservation.find(params[:reservation_id])
  		@reservation.destroy

  		redirect_to root_path
	end



private
	def reservation_params
		params.require(:reservation).permit(:start_date, :end_date, :user_id, :listing_id, :price, :total, :status)
	end
end

