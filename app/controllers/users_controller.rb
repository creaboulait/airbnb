class UsersController < Clearance::UsersController
	before_action :set_user, only: [:show, :edit, :update]
	
	def create
		user = User.new(user_params)
		user.save

		redirect_to sign_in_path
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

