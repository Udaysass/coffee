class DashbordController < ApplicationController
  before_action :authenticate_user!, only: [:show_all_carts]
  def index
  	@coffees = Coffee.all
  end

  def show_all_carts
  	@coffees = Coffee.all
  end
end
