class UsersController < Clearance::UsersController
	before_action :set_user, only: [:show, :edit, :update]
	
	def create
		@user = User.new(user_params)
		
		respond_to do |format|
			if @user.save
				# Tell the UserMailer to send a welcome email after save
        		WelcomeMailer.welcome_email(@user).deliver_now
        		format.html { redirect_to sign_in_path(@user, notice: 'User was successfully created.') }
        		format.json { render json: @user, status: :created, location: @user }
        	else
        		format.html { render action: 'new' }
        		format.json { render json: @user.errors, status: :unprocessable_entity }
        	end
		# redirect_to sign_in_path
		end
	end

	def show
	end

	def edit
	end

	def update
		
		if current_user.id == @user.id
			@user.update(user_params)
     		render 'edit'
    	else
      		redirect_to root_path, notice: "You don't have permission to edit profile."
    	end
	end

	

	private

	def set_user
		@user = User.find(params[:id])
	end

	#Use strong params
  	def user_params
    	params.require(:user).permit(:email, :password, :first_name, :last_name, :profilepic)
  	end
end

