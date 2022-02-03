class CoffeesController < ApplicationController
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
    item = Item.find_by(itemable_id: current_user.id, coffee_id: @coffee.id)
    if item.blank?
      # this line find itemable_id as current_user.id or coffee_id
     current_user.items.create(itemable_type:"user", coffee_id: @coffee.id, quantity: 1)
     # assign the value or create
      else
      # item = Item.find(u[0].id)
      item.increment!(:quantity)
      # this increment the quantity 
      item.reload.quantity 
      #show the actual qunatity after update 
      # item = item.update(quantity: u[0].quantity + 1)
    end
    respond_to do |format|
      format.html { redirect_to show_all_carts_path, notice: 'Coffee. Add to Cart.' }
    end  
  end 


  def remove_user_card                                
    if current_user.items == []
      redirect_to root_path, notice: 'First Add the coffee then can remove.'
    else
      item = Item.find_by(itemable_id: current_user.id, coffee_id: @coffee.id)
      item.decrement!(:quantity)
      item.reload.quantity
      redirect_to show_all_carts_path
      # item = item.update(quantity: u[0].quantity - 1)
    end 
  end


  private 
  
  def set_coffee
   @coffee =  Coffee.find(params[:id])
  end 


  def coffee_params
    params.require(:coffee).permit(:name, :amount, :image)
  end
end