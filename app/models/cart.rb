class Cart < ApplicationRecord
	belongs_to :user
	has_many :cart_items
	#has_many :orders, through: :cart_items
	
  # def total_price
  #   cart_items.to_a.sum { |item| item.total_amount }
  # end
end
	