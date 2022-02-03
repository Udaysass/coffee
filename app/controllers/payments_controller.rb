class PaymentsController < ApplicationController

   
  def index
    @payments = current_user.payments
  end  

  def new
    @payment = Payment.new
    @order_id = params[:order_id]
    @user_id = params[:user_id]
  end

  def create  
    @payment = Payment.new(payment_params)
    if @payment.save
       UserMailer.order_confirmation(@order, current_user).deliver
       redirect_to thanks_path, notice: "Order Completed Successfully."
      else
      render :new 
    end
  end

  def show
    @payment = Payment.find(params[:id])
  end

  private
  def payment_params
    params.require(:payment).permit(:payment_type, :cvc, :cc_exp_month, :card_number, :order_id, :user_id)
  end
end
