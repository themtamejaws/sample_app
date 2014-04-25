class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :order_number
      t.string :size
      t.decimal :price
      t.integer :user_id

      t.timestamps
    end
    add_index :orders, [:user_id, :created_at]
  end
end
