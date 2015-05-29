class AddUnitPriceToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :unit_price, :decimal , precision: 8, scale: 2
  end
end
