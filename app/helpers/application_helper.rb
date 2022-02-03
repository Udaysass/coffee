module ApplicationHelper

	def coffee_count(cart)
		counts = Item.where(user_id: cart.user_id, coffee_id: cart.coffee_id).count
	end

 	def sub_total(card)
	    sum = 0 
	      sum = card.coffee.amount * card.quantity
	    return sum
  	end

  	


  	def total_price(tp)

       s = tp.map{|i| i.coffee.amount * i.quantity}
		s.sum
   end

end
