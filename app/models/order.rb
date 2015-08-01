class Order < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  has_many :products, :through => :line_items
  validates_presence_of :user_name, :email, :address, :pay_type

  PAYMENT_TYPES = [
      [ "Check", "check" ],
      [ "Credit Card", "cc" ],
      [ "Purchase Order", "po" ]
  ].freeze
  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
