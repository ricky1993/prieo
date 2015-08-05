class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  has_many :products, :through => :line_items
  belongs_to :user




  def add_product(product_id, product_title, product_price)
    current_item = line_items.find_by_product_id(product_id)
    if current_item
      current_item.quantity += 1
      current_item.save
    else
      LineItem.create(:product_id => product_id, :title => product_title, :unit_price => product_price, :cart_id => id, :quantity => 1).save
    end
  end

  def empty!
    line_items.length == 0
  end

  def total_price
    line_items.to_a.sum{|item| item.total_price}
  end
end