class AddToPolymorphicAttrsToOrderItems < ActiveRecord::Migration[6.0]
  def change
    add_column :order_items, :itemable_type, :string
    add_column :order_items, :itemable_id, :integer
    remove_column :order_items, :order_id, :integer
  end
end
