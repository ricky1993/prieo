module Admin::PropertiesHelper
  def size_helper(product_id)
    @sizes = Property.where(:propertytype =>Property::PRODUCTSIZE).where(:product_id => product_id).order(:created_at=>:desc)
  end

  def material_helper(product_id)
    @sizes = Property.where(:propertytype =>Property::PRODUCTMATERIAL).where(:product_id => product_id).order(:created_at=>:desc)
  end
end
