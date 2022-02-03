class UserCard < ApplicationRecord
  belongs_to :user
  belongs_to :coffee
  has_many :items, :as => :itemable
end 