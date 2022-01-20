class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
          # has_one :cart
          # has_many :orders
          # has_many :payments
          # has_one :wallet, :through =>:payment
    
    has_many :user_cards, dependent: :destroy
    has_many :coffees, through: :user_cards 
end
