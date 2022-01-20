class DashboardController < ApplicationController
  before_action :authenticate_user!, only: [:show_all_carts]
  def index
  	@coffees = Coffee.all
  end

  def show_all_carts
    @coffees = Coffee.all
    @user_fav_coffee = current_user.user_cards.pluck(:coffee_id) if user_signed_in?
  end

 private
  def cart_item_price
    current_user.user_fav_coffee.pluck(:coffee_price)
  end  
end
