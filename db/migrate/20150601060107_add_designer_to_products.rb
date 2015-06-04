class AddDesignerToProducts < ActiveRecord::Migration
  def up
    add_column :products, :designer, :string
  end
  def down
    remove_column :products, :designer
  end
end
