class Payment < ApplicationRecord
  belongs_to :user_card
# validates :card_number, format: { with: ^(?:4[0-9]{12}(?:[0-9]{3})? ,
#     message: "only allows no" }

 validates :card_number, length: { maximum: 16,
    too_long: "%{count} number is the maximum allowed" }
    validates :cvc, length: { maximum: 4,
    too_long: "%{count} number is the maximum allowed" }
end
  