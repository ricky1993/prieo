class Resource < ActiveRecord::Base
  belongs_to :product

  #使用常量定义资源的类型
  GLOBAL_HEADER = '全局页头图片插件'
  GLOBAL_FOOTER = '全局页脚图片插件'
  GLOBAL_BODY   = '全局页面图片插件'

  GLOBAL = [GLOBAL_HEADER,GLOBAL_FOOTER,GLOBAL_BODY]

  PRODUCT_ENTIRE = '商品整体图片'
  PRODUCT_PARTIAL = '商品局部图片'

  PRODUCT = [PRODUCT_ENTIRE,PRODUCT_PARTIAL]

  PROPERTY = GLOBAL + PRODUCT

  HIGH = '高'
  MEDIUM = '中'
  LOW = '低'

  PRIORITY = [HIGH,MEDIUM,LOW]

  mount_uploader :path,PathUploader




end
