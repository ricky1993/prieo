class AddVisitsToProducts < ActiveRecord::Migration
  def up
    add_column :products, :visits, :integer
  end
  def down
    remove_column :products, :visits
  end
end
