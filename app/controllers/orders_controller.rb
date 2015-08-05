class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find_by_out_trade_no(params[:out_trade_no])
  end

  # GET /orders/new
  def new
    @cart = find_cart
    if @cart.line_items.empty?
      redirect_to store_index_url, notice: "Your cart is empty"
      return
    end
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(find_cart)
    @order.out_trade_no =  Time.now.to_i.to_s
    @order.total_fee = @order.total_price
    @order.subject = "您的订单"
    @order.save
    find_cart.destroy
    session[:cart_id] = nil
    redirect_to @order.pay_url
  end

  def done
    redirect_to '/orders/' + @order.out_trade_no
  end

  def notify
    if @order.trade_status == "finished"
      render text: 'success'
    else
      render text: 'processing'
    end
  end
  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def pay

  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def update_order

    end
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:user_name, :email, :address, :pay_type, :out_trade_no)

    end
end
