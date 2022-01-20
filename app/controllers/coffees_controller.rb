class CoffeesController < ApplicationController
  #before_action :authenticate_user!
  before_action :set_coffee, only: %i[show edit  update destroy add_user_card remove_user_card ]
  before_action :authenticate_user!, only: [:add_user_card, :remove_user_card]

  def index
    @coffees =  Coffee.all
  end

  def show
    @coffee = Coffee.find(params[:id])
  end 
  
  def new
    @coffee = Coffee.new
  end

  def create
    @coffee = Coffee.new(coffee_params)
    if @coffee.save
      redirect_to  [:admin, @coffee]
    else
      render :new
    end 
  end

  def edit
    @coffee = Coffee.find(params[:id])
  end

  def update
    @coffee = Coffee.find(params[:id])
    if coffee.update(coffee_params)
      redirect_to admin_coffee_path
    else
      render :edit
    end 
  end

  def destroy
    @coffee.destroy
    redirect_to admin_coffees_path
  end  

  def add_user_card
    if (UserCard.where(user_id: current_user.id, coffee_id: @coffee.id).blank?)
      UserCard.create(user_id: current_user.id, coffee_id: @coffee.id, quantity: 1)
    else
      u = UserCard.where(user_id: current_user.id, coffee_id: @coffee.id)
      @usercard = UserCard.find(u[0].id)
      @usercard = UserCard.update(quantity: u[0].quantity + 1)
    end
    respond_to do |format|
      format.html { redirect_to show_all_carts_path, notice: 'Coffee. Add to Cart.' }
    end  
  end 



  def remove_user_card
    
    if current_user.user_cards == []
      redirect_to root_path, notice: 'First Add the coffee then can remove.'
    else
       u = UserCard.where(user_id: current_user.id, coffee_id: @coffee.id)
      @usercard = UserCard.find(u[0].id)
      @usercard = UserCard.update(quantity: u[0].quantity - 1)
      #UserCard.find_by(user_id: current_user.id, coffee_id: @coffee.id).destroy

    end
    redirect_to show_all_carts_path
  end

  

  private 

   def cart_item_price
    current_user.user_fav_coffee.pluck(:coffee_price)
  end  
  
  def set_coffee
   @coffee =  Coffee.find(params[:id])
  end 


  def coffee_params
    params.require(:coffee).permit(:name, :amount, :image)
  end

end