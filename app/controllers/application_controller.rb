class ApplicationController < ActionController::Base
  include Clearance::Controller

  	 #Check if current_user has admin access or not.
  def admin?
  	if current_user.role == "admin"
  		return true
  	end
  end

  
  # Check if current_user has moderator access or not.
  def moderator?
  	if current_user.role == "moderator"
  		return true
  	end
  end

end

