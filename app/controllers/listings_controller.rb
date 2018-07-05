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
     		render 'listings/edit.html.erb'
    	else
      		redirect_to root_path, notice: "You don't have permission to edit listing."
    	end
	end

	def update
    	@listing = Listing.find(params[:id])

      	@listing.description = params[:listing][:description]
      	@listing.price = params[:listing][:price]
      	@listing.place_type = params[:listing][:place_type]
      	@listing.up_to_guests_num = params[:listing][:up_to_guests_num]
      	@listing.bedrooms_num = params[:listing][:bedrooms_num]
      	@listing.beds_num = params[:listing][:beds_num]
      	@listing.bathrooms_num = params[:listing][:bathrooms_num]
  		@listing.save

  		redirect_to root_path	
  	end


  	def destroy
  		@listing = Listing.find(params[:id])
  		@listing.destroy

  		redirect_to root_path
  	end

	private
	def listing_params
    	params.require(:listing).permit(:description, :price, :area, :place_type, :up_to_guests_num, :house_type, :bedrooms_num, :beds_num, :bathrooms_num, :address)
  	end

end

