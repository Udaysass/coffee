class OrderItem < ApplicationRecord
  # belongs_to :order
  belongs_to :coffee
  # belongs_to :itemable, polymorphic: true
end
