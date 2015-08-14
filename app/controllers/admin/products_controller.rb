class Admin::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  load_and_authorize_resource

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    @count=0
    render :layout => 'admin/layouts/application'
  end

  # GET /products/1
  # GET /products/1.json
  def show
    render :layout => 'admin/layouts/application'
  end

  # GET /products/new
  def new
    @product = Product.new
    render :layout => 'admin/layouts/application'
  end

  # GET /products/1/edit
  def edit
    render :layout => 'admin/layouts/application'
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to admin_products_path, notice: '商品成功创建.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to controller:'admin/products',action:'show',id:@product.id, notice: 'Product was successfully updated.' }
        format.json { render 'admin/products/show', status: :ok, location: @product }
      else
        format.html { render 'admin/products/edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
  end

  # DELETE /products/1
  # DELETE /products/1.js

  def destroy
    @product.destroy
    redirect_to admin_products_url, notice: '成功删除'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id].to_i)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:title, :description, :image_url, :price, :designer)
  end


end