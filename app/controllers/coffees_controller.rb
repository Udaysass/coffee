class CoffeesController < ApplicationController
 
  
  def index
    @coffees =  Coffee.all
  end

  def show
    @coffee = Coffee.find(params[:id])
  end 

 

 private 
  
  def coffee_params
    params.require(:coffee).permit(:name, :amount, :image)
  end
end
