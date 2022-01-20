class CartItem < ApplicationRecord
	belongs_to :coffee
	belongs_to :user
	belongs_to :Cart

	def total_price
    	coffee.amount.to_i * quantity.to_i
  	end
end
