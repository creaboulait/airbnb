class ListingsController < ApplicationController
  # before_action :require_login, only [:new, :create]


	def index
		@listing = Listing.page(params[:page]).per(10)
		render 'welcome/index.html.erb'
	end

  def search
    
    @listings = Listing.where(nil) # creates an anonymous scope
    @listings = @listings.city_search(params[:city_search]) if params[:city_search].present?
    @listings = @listings.bedrooms_search(params[:bedrooms_search]) if params[:bedrooms_search].present?
    @listings = @listings.bathrooms_search(params[:bathrooms_search]) if params[:bathrooms_search].present?
    @listings = @listings.price_range(params[:min_price], params[:max_price])
    
  end

	def new
		@listing = Listing.new
	end

	def create
		@listing = Listing.new(listing_params)
		@listing.user_id = current_user.id
		@listing.save

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
        @listing.galleries = params[:listing][:galleries]

  		@listing.save

  		redirect_to root_path	
  	end

  	def verify
  		
   		@listing = Listing.find(params[:id])
   		@listing.verify!
   		redirect_to root_path 
  	end

  	
  	def destroy
  		@listing = Listing.find(params[:id])
  		@listing.destroy

  		redirect_to root_path
  	end

	private
    
  def filtering_params
    params.require(:listing).permit(:city_search, :bedrooms_search, :bathrooms_search, :price_range)
  end

	def listing_params
    	params.require(:listing).permit(:description, :price, :area, :place_type, :up_to_guests_num, :house_type, :bedrooms_num, :beds_num,
    	 :bathrooms_num, :country, :state, :city, :zipcode, :address, :verification,{galleries: []}, amenities: [])
  	end

  

end

