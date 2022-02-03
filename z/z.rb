# frozen_string_literal: true

require 'rails_helper'

describe Payment, type: :model do
  subject do
    Payment.new(payment_type: 'Credit card', card_number: 1_212_334_564_234_451, cvc: 2445, itemable_id: 1)
  end

  before { subject.save }

  it 'card_number should be present ' do
    subject.card_number =  nil
    expect(subject).to_not be_valid
  end

  it 'cvc should be present' do
    subject.cvc = nil
    expect(subject).to_not be_valid
  end

  it 'card_number should not to be long ' do
    subject.card_number = '1' * 16
    expect(subject).to_not be_valid
  end

  it 'cvc should not be long' do
    subject.cvc = '1' * 4
    expect(subject).to_not be_valid
  end
end




# frozen_string_literal: true

require 'rails_helper'

describe Coffee, type: :model do
  subject do
    Coffee.new(name: 'black', amount: 200)
  end

  before { subject.save }

  it 'name should be present ' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'amount should be present ' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end
end



# frozen_string_literal: true
require 'rails_helper'

describe Order, type: :model do
  subject do
    Order.new(total: 1000, address: 'vijay nagar,Indore', permanent_address: 'vijay nagar,Indore', mobile_no: 9_826_034_567,
              pincode: 452_001, itemable_id: 1)
  end



  # order = create(:order)
      # user = create(:user)
      # coffee = create(:coffee)

  before { subject.save }

  it 'permanent_address should be present ' do
    subject.permanent_address =  nil
    expect(subject).to_not be_valid
  end

  it 'mobile_no should be present ' do
    subject.mobile_no =  nil
    expect(subject).to_not be_valid
  end

  it 'pincode should be present' do
    subject.pincode = nil
    expect(subject).to_not be_valid
  end

  it 'mobile_no should not to be long ' do
    subject.mobile_no = '1' * 10
    expect(subject).to_not be_valid
  end

  it 'pincode should not be long' do
    subject.pincode = '1' * 6
    expect(subject).to_not be_valid
  end
end



===================================`[[ 35 != 0 ]] && echo; echo`=begin rdoc
  
  FactoryBot.define do
  factory :order do
      address { "vijay nagar, indore" }
      permanent_address { "vijay nagar, indore" }
      mobile_no { 8988828398 }
      pincode { 452001 }
      total { current_user.items }
      user_id { current_user.id } 
    end
  end

  factory :order do
    address { "sheetal nagar, indore" }
    permanent_address { "sheetal nagar, indore" }
    mobile_no { 8988823398 }
    pincode { 452020 }
    total { current_user.items }
    user_id { current_user.id } 
  end

  factory :order do
    address { "ganesh nagar, indore" }
    permanent_address { "ganesh nagar, indore" }
    mobile_no { 8988828598 }
    pincode { 452015 }
    total { current_user.items }
    user_id { current_user.id } 
  end


  factory :order do
    address { "LIG , indore" }
    permanent_address { "LIG, indore" }
    mobile_no { 8980028398 }
    pincode { 452004 }
    total { current_user.items }
    user_id { current_user.id } 
  end
end



# describe 'callbacks' do
  #   describe 'before save' do
  #     describe 'on create' do
  #       subject! { create(:order) }
  #       before { subject.run_callbacks(:save) }
  #       it { is_expected.to callback(:ensure_item_present).after(:save) }

  #     end
  #   end
  # end


  # it 'user  should be present ' do
  #   subject.permanent_address = 'vijay nagar,Indore'
  #   subject.mobile_no = 9_892_011_289
  #   subject.pincode = 452_003
  #   subject.user_id = 1
  #   expect(subject).to be_valid
  # end



  -=======================================
  def remove_user_card                                
    if current_user.items == []

      redirect_to root_path, notice: 'First Add the coffee then can remove.'
    elsif 
        item.quantity = 1
        item.destroy
    else
      item = Item.find_by(itemable_id: current_user.id, coffee_id: @coffee.id)
      # item  = Item.find(u[0].id)
      item.decrement!(:quantity)
      item.reload.quantity
      redirect_to show_all_carts_path
      # item = item.update(quantity: u[0].quantity - 1)
    end 
  end