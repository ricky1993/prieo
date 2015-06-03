class Designer::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
   # @products = Product.where(:designer => current_user)
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def show

  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to :action => 'edit', :id => Product.last
    #    respond_to do |format|
#      if @product.save
#        format.html { redirect_to @product, notice: 'Product was successfully created.' }
#        format.json { render :show, status: :created, location: @product }
#      else
#        format.html { render :create }
#        format.json { render json: @product.errors, status: :unprocessable_entity }
#      end
#    end
  end

  def update
    @product.update(product_params)
    redirect_to :action => 'index'
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :image_url, :price)
  end
end
