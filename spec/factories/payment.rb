FactoryBot.define do
  factory :payment do
    payment_type { "Credit card" }
    card_number { 1212334564234451 }
  	cvc { 345 }
  	# cc_exp_month { 2025/12/01 }
	user_id { 1 }
	order_id { 1 }
  end
end