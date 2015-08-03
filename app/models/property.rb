class Property < ActiveRecord::Base
  belongs_to :product
  #使用常量来定义属性的类型
  PRODUCT_SIZE = '商品尺寸'
  PRODUCT_MATERIAL = '商品材质'

end
