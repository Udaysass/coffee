class DashboardController < ApplicationController
  before_action :authenticate_user!, only: [:show_all_carts]
  def index
  	@coffees = Coffee.all
  end

  def show_all_carts
    @coffees = Coffee.all
    @user_fav_coffee = current_user.items.pluck(:coffee_id) if user_signed_in?
  end
end
