class Designer::ProductsController < ApplicationController
  def index
    @products = Product.where(:designer => current)
  end

  def create
    @products
  end
end
