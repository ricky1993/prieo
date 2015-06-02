class AddDesignerToProducts < ActiveRecord::Migration
  def change
    add_column :users, :designer, :string
  end
end
