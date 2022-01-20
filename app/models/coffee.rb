class Coffee < ApplicationRecord
	#validates :name, presence: true, length: { maximum: 20 }
  	#validates :amount, presence: true, length: { minimum: 4 }
  	has_one_attached :image
  	has_many :user_cards
    has_many :users, through: :user_cards
  	
end
