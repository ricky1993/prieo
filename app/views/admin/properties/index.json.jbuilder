json.array!(@properties) do |property|
  json.extract! property, :id, :name, :propertytype, :value, :state,:product_id
  json.url admin_properties_url(product, format: :json)
end
