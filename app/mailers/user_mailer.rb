class UserMailer < ApplicationMailer
 default from: 'admin.sass@gmail.com'
 
 def new_user_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to coffee shop!')
 end 

  def order_confirmation(user, order)
    @user = user
    @order = order 
    mail(to: order.email, subject: 'Order has been created')
  end

 # def create
 #    @user = User.new(user_params)
 #    respond_to do |format|
 #      if @user.save
 #      UserMailer.new_user_email(@user).deliver_now
 #  end      
end
