class PaymentsController < ApplicationController

  def new
  	@client_token = Braintree::ClientToken.generate
  	@reservation = Reservation.find(params[:id])
  end

  
  def checkout
  	
  	@reservation = Reservation.find(params[:id])
  	nonce_from_the_client = params[:checkout_form][:payment_method_nonce]

  	result = Braintree::Transaction.sale(
   	:amount => @reservation.total.to_s,  
   	:payment_method_nonce => nonce_from_the_client,
   	:options => {
   	   :submit_for_settlement => true
   	 }
   	)

    
  	  if result.success?
        @reservation.update(status: "Paid")
  	     redirect_to root_path, :flash => { :success => "Transaction successful!" }
        # ReservationMailer.booking_email(current_user.email, @reservation.listing.user.email, @reservation.id).deliver_now
        # format.html { redirect_to root_path(@user, notice: 'Reservation was successfully created.') }
        # format.json { render json: @reservation.user, status: :created, location: @reservation.user }
  	  else
  	   redirect_to :root, :flash => { :error => "Transaction failed. Please try again." }
        # format.html { redirect_to root_path}
        # format.json { render json: @reservation.user.errors, status: :unprocessable_entity }
  	  end
    
  end
        
end


