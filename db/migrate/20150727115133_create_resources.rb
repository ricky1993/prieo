class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :name
      t.string :kind
      t.integer :priority
      t.text :description
      t.string :path
      t.boolean :check

      t.timestamps null: false
    end
  end
end
