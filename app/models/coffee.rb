class Coffee < ApplicationRecord
  	has_one_attached :image
  	has_many :user_cards
    has_many :users, through: :user_cards
	# has_many :order_items
 #  has_many :orders, through: :order_items
 	
	validates :name, presence: true, length: { maximum: 20 }
  	validates :amount, presence: true, length: { minimum: 4 }
end
