class Property < ActiveRecord::Base
  belongs_to :product
  #使用常量来定义属性的类型
  PRODUCTSIZE = '商品尺寸'
  PRODUCTMATERIAL = '商品材质'

  PRODUCTTYPE=[PRODUCTSIZE,PRODUCTMATERIAL]

end
