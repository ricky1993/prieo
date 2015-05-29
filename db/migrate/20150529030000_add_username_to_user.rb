class AddUsernameToUser < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    remove_column :line_items, :unit_price
  end
end
