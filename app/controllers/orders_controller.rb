class OrdersController < ApplicationController
  before_action :find_order, only: [:show]
   before_action :set_user
  
  def index
    @orders = current_user.orders
   # @orders = Order.all
  end

  def new
    @order = Order.new
  end


  def show
    @order = Order.find(params[:id])
    if @order.reviews.blank?
      @average_review = 0
    else
      @average_review = @order.reviews.average(:rating).round(2)
    end
  end


  def create
    if current_user.items.exists?
      @order = Order.new(total: params[:total], user_id: current_user.id, address: params[:address], permanent_address: params[:permanent_address], mobile_no: params[:mobile_no], pincode: params[:pincode] )
      @order.save
      order_item = current_user.items.update(itemable_id: @order.id, itemable_type: "Order")
      redirect_to order_path(@order)
    else
      render 'new'
    end
  end

  def thanks
  end  
    
    
  # def confirm
  #   @order = Order.new
  #   @user_cards = current_user.user_cards
  # end 
  
  private

  def find_order
    @order = Order.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def order_params
    params.require(:order).permit(:total, :address, :permanent_address, :mobile_no, :pincode, :itemable_id)
  end
end
  