class Admin::CoffeesController < Admin::AdminsController
  #before_action :authenticate_!

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
    @coffee = Coffee.new(params[:id])
    if coffee.save
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
      redirect_to @coffee
    else
      render :edit
    end 
  end

  private

  def coffee_params
    params.require(:coffee).permit(:name, :amount)
  end
end
