class PaymentsController < ApplicationController

  before_action 
  def index
    @payments = Payment.all
  end  

  def new
    @payment = Payment.new
    @cart_id = params[:cart_id]
  end

  def create  
    @payment = Payment.new(payment_params)

    if @payment.save
      redirect_to orders_index_path
    else
      render :new 
    end
  end

  def show
    @payment = Payment.find(params[:id])
  end

  private

  def payment_params
    params.require(:payment).permit(:payment_type, :cvc, :cc_exp_month, :card_number, :user_card_id)
  end
end
