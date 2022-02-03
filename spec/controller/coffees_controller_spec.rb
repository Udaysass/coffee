# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CoffeesController, type: :controller do
  let!(:user) { FactoryBot.create(:user) }
  let(:coffee) { FactoryBot.create(:coffee) }
  let(:coffees) { create_list :coffee, 2 }
  it 'can be created' do
    expect(user.save).to be true
    expect(coffee.save).to be(true)
  end

  describe 'coffees' do
    describe 'GET coffees#index' do
      context 'when the user is on dashboard' do
        it 'displays all coffees' do
          get :index
        end
      end
    end

    it 'show the coffee details' do
      # expect(Coffee.find_by_id(2)).to eq(@coffee)
      expect(Coffee.find(coffee.id)).to eq(coffee)
    end

    describe 'coffees#create' do
      let(:coffee) { FactoryBot.create(:coffee) }
      it 'can be created' do
        expect(coffee.save).to be true
      end
    end

    it 'edit the specific coffee ' do
      expect(Coffee.find(coffee.id)).to eq(coffee)
    end

    it 'checks that a coffee can be updated' do
      expect(Coffee.find(coffee.id)).to eq(coffee)
      coffee.update(name: 'cold coffee', amount: 1500)
      expect(coffee.save).to be true
    end

    it 'checks that a coffee can be destroyed' do
      coffee.destroy
      expect(Coffee.count).to eq(0)
    end

    it 'checks that a coffee be destroyed' do
      coffee.destroy
      # expect(Coffee.find(coffee.id)).to eq(coffee)
      # expect(Coffee.find_by(name: "black")).to be_nil
    end

    describe 'add to cart #coffee' do
       let!(:user) { FactoryBot.create(:user) }
      expect(Item.find(itemable_id: user.id, coffee_id: @coffee.id).blank?).to eq(item)
       let!(:item) do
        user.items.create(itemable_id: user.id, itemable_type: 'user', coffee_id: coffee.id, quantity: 2)
      end
      it 'can be added' do
        expect(user.save).to be true
        expect(item.save).to be true
      end
    end
  end
end
