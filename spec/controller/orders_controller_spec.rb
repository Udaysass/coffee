# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  let!(:user) { FactoryBot.create(:user) }
  let!(:coffee) { FactoryBot.create(:coffee) }
  let!(:order) { FactoryBot.create(:order) }

  it 'should be present' do
    expect(order.id).to eq(1)
    expect(user.id).to eq(1)
    expect(coffee.id).to eq(1)
  end

  describe "orders" do
    describe "GET orders#index" do
      context "when the user is on order index page" do
        it "should list  of all order items" do
          # get :index
         # expect(:orders).to eq([order])
        end   
     end
    end
 

    describe "GET orders#new" do
     it "should render orders#new " do
      end
    end



    describe "post orders#create" do
      let!(:user) { FactoryBot.create(:user) }
      let!(:order) { FactoryBot.create(:order) }
      let!(:item) do
      end
      it 'can be created' do
      item = user.items.create(itemable_id: user.id, itemable_type: 'user', coffee_id: coffee.id, quantity: 1)
        expect(order.save).to be true
        expect(user.save).to be true
        expect(coffee.save).to be true
        expect(item.save).to be true
      end  
    end

    describe "GET orders#show" do
     it "should render orders#show template" do
      end
    end
  end
end
