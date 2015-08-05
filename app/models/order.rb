class Order < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  has_many :products, :through => :line_items
  validates_presence_of :user_name, :email, :address, :pay_type

  PAYMENT_TYPES = [
      [ "网上支付", "op" ],
      [ "货到付款", "cash" ]
  ].freeze
  def pay_url
    Alipay::Service.create_direct_pay_by_user_url({
                                                          out_trade_no: out_trade_no,
                                                          subject: subject,
                                                          total_fee: total_fee,
                                                          return_url: 'https://alipay.prieo.com/orders/' + out_trade_no + '/done',
                                                          notify_url: 'https://alipay.prieo.com/orders/' + out_trade_no + '/notify'
                                                  })
  end
  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  def total_price
    res = 0
    line_items.each do |item|
      res += item.quantity * item.unit_price
    end
    res
  end
end
