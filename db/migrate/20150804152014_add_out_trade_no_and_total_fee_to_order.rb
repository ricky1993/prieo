class AddOutTradeNoAndTotalFeeToOrder < ActiveRecord::Migration
  def up
    add_column :orders, :out_trade_no, :string
    add_column :orders, :subject, :string
    add_column :orders, :total_fee,  :decimal , precision: 8, scale: 2
    add_column :orders, :trade_status, :string
    add_column :line_items, :title, :string
  end
  def down
    remove_column :orders, :out_trade_no
    remove_column :orders, :subject
    remove_column :orders, :total_fee
    remove_column :orders, :trade_status
    remove_column :line_items, :title
  end
end
