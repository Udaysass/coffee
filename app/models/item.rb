class Item < ApplicationRecord
	 belongs_to :itemable, polymorphic: true
  	 belongs_to :coffee
  	 #belongs_to :user_card
  	 # has_many :payments
end


