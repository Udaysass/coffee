class CoffeesController < ApplicationController
  #before_action :authenticate_user!
  before_action :authenticate_user!, only: [:add_user_card, :remove_user_card]
  def index
    @coffees =  Coffee.all
  end

  def show
    @coffee = Coffee.find(params[:id])
  end 

  def add_user_card
    UserCard.create(user_id: current_user.id, coffee_id: @coffee.id)
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Coffee. Add to Fav.' }
    end  
  end 

  def remove_user_card
    if current_user.user_card == []
      redirect_to root_path, notice: 'First Add the coffee then can remove.'
    else
      UserCard.find_by(user_id: current_user.id, coffee_id: @coffee.id).destroy
      respond_to do |format|
        format.html { redirect_to root_path }
      end
    end
  end

 private 
  
  def coffee_params
    params.require(:coffee).permit(:name, :amount, :image)
  end
end
