class UsersController < Clearance::UsersController

	def create
		user = User.new(user_params)
		user.save

		redirect_to sign_in_path
	end

	private
	#Use strong params
  	def user_params
    	params.require(:user).permit(:email, :password, :name, :gender, :age)
  	end
end

