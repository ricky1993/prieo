class Order < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  has_many :products, :through => :line_items
  validates_presence_of :user_id, :email, :address, :pay_type

  PAYMENT_TYPES = [
      [ "Check", "check" ],
      [ "Credit Card", "cc" ],
      [ "Purchase Order", "po" ]
  ].freeze
end
