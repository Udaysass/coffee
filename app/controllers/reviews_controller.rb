class ReviewsController < ApplicationController
	before_action :find_order

	def new
		@review = Review.new		
	end

	def create
		#byebug
		@review = Review.new(review_params)
		@review.order_id = @order.id
		@review.user_id = current_user.id
		if @review.save
			redirect_to order_reviews_path
		else
		render :new
		end	
	end

	def edit
	end	

	def update
		if @review.update(review_params)
			redirect_to order_path(@order)
		else
			render 'edit'
		end
	end

	private
	def find_order
		@order = Order.find(params[:order_id])
	end


	def review_params
		params.require(:review).permit(:rating, :comment, :order_id)
	end	
end
