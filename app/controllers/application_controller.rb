class ApplicationController < ActionController::Base

   before_action :authenticate_user!
 
	
 def show_user_carts
    @user_coffee = current_user.item.count if user_signed_in?
  end
end
