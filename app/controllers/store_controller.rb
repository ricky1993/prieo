class StoreController < ApplicationController
  def index
    @products = Product.salable_items
  end

  def save_order
    @cart = find_cart
    @order = Order.new(params[:order])
    @order.line_items << @cart.line_items
    if @order.save
      redirect_to(:action => 'empty_cart')
    else
      redirect_to()
    end
  end

  def empty_cart
    @cart=find_cart
    if @cart.empty!
      flash[:notice] = 'Your cart is now empty!'
      redirect_to(:action => 'index')
    else
      @cart.line_items.clear
      redirect_to(:action => 'index')
    end
  end

  def display_cart
    @cart = find_cart
    #@items = @cart.items
  end

  def add_to_cart
    product = Product.find(params[:id].to_i)
    @cart = find_cart
    @cart.add_product(product.id, product.title, product.price)
    redirect_to(:action => 'display_cart')
  end


end
