class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  def index
    @carts = Cart.all
  end

  def show
  end

  def new
    @cart = Cart.new
  end

  def create
    @cart = Cart.new(cart_params)
  end

  def destroy
    @cart = current_cart
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cart
    @cart = Cart.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cart_params
    params[:cart]
  end
end
