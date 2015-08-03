class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  has_many :products, :through => :line_items
  belongs_to :user




  def add_product(product_id)
    current_item = line_items.find_by_product_id(product_id)
    if current_item
      current_item.quantity += 1
      current_item.save
    else
      LineItem.create(:product_id => product_id, :cart_id => id, :quantity => 1).save
    end
  end

  def empty!
    line_items.length == 0
  end

  def total_price
    line_items.to_a.sum{|item| item.total_price}
  end
end