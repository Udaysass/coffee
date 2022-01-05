class ApplicationController < ActionController::Base
  def show_user_carts
    @user_coffee = current_user.user_card.count if user_signed_in?
  end
end
