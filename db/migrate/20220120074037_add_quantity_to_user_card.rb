class AddQuantityToUserCard < ActiveRecord::Migration[6.0]
  def change
    add_column :user_cards, :quantity , :integer
  end
end
