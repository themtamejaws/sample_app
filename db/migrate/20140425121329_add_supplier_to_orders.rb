class AddSupplierToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :order_supplier, :string
    rename_column :orders, :name, :order_name
    rename_column :orders, :size, :order_size
    rename_column :orders, :price, :order_price
  end
end
