class Coffee < ApplicationRecord
	validates :name, presence: true, length: { maximum: 20 }
  	validates :amount, presence: true, length: { minimum: 4 }
end
