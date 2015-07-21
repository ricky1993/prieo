class AddPropertyToOrder < ActiveRecord::Migration
  def up
    add_column :orders, :user_id, :integer
    add_column :orders, :state, :string
    add_column :orders, :email, :string
    add_column :orders, :address, :string
    add_column :orders, :pay_type, :string
    add_column :line_items, :order_id, :integer
    add_column :line_items, :unit_price, :decimal , precision: 10, scale: 2

  end

  def down
    remove_column :orders, :user_id
    remove_column :orders, :state
    remove_column :orders, :email
    remove_column :orders, :address
    remove_column :orders, :pay_type
    remove_column :line_items, :order_id
    remove_column :line_items, :unit_price
  end
end
