module ApplicationHelper

	def coffee_count(cart)
		counts = UserCard.where(user_id: cart.user_id, coffee_id: cart.coffee_id).count
	end

end
