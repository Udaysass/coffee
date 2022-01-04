class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.string :payment_type
      t.integer :user_id
      t.integer :order_id
      t.string :status

      t.timestamps
    end
  end
end
