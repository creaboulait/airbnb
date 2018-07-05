class ListingsController < ApplicationController

	def index
	end

	def new
		@listing = Listing.new
		# render 'listings/new.html.erb'
	end

	def create
		listing = Listing.new(listing_params)
		listing.user_id = current_user.id
		listing.save

		redirect_to root_path
	end

	def show
		@listing = Listing.find(params[:id])
		render 'listings/show.html.erb'
	end

	def edit
		@listing = Listing.find(params[:id])
		if current_user.id == @listing.user_id
     		render
    	else
      		redirect_to root_path, notice: "You don't have permission to edit listing."
    	end
	end

	private
	def listing_params
    	params.require(:listing).permit(:description, :price, :area, :place_type, :up_to_guests_num, :house_type, :bedrooms_num, :beds_num, :bathrooms_num, :address)
  	end

end

