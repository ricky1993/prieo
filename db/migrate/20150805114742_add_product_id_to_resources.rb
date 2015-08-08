class AddProductIdToResources < ActiveRecord::Migration
  def change
    add_column :resources, :product_id, :integer
  end
end
