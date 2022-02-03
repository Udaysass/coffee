class Order < ApplicationRecord
	 # has_many :order_items
  # has_many :coffees, through: :order_items 
    belongs_to :user 
    has_many :reviews
  	has_many :items, :as => :itemable
  	validates :permanent_address, presence: true
  	validates :mobile_no, presence: true, length: { maximum: 10, too_long: "%{count} number is the maximum allowed" }
    validates :pincode, presence: true, length: { maximum: 6, too_long: "%{count} digit pincode number only  allowed" }
    # before_save :ensure_item_present
end


  private

 
  def ensure_item_present   
    if self.order.items.present?
      order.save
    end
  end

            