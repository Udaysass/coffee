class Payment < ApplicationRecord
  # belongs_to :user_card
  belongs_to :order
    # has_many :items, :as => :itemable
    # validates :card_number, format: { with: ^(?:4[0-9]{12}(?:[0-9]{3})? ,
    #     message: "only allows no" }
    belongs_to :user
    validates :card_number, presence: true, length: { maximum: 16, too_long: "%{count} number is the maximum allowed" }
    validates :cvc, presence: true, length: { maximum: 4, too_long: "%{count} number is the maximum allowed" }
end
  