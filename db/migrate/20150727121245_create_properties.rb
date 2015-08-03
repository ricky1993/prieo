class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :name
      t.string :propertytype
      t.string :value
      t.boolean :state
      t.integer :product_id
      t.integer :priority

      t.timestamps null: false
    end
  end
end
