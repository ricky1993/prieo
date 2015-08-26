class Admin::PropertiesController < ApplicationController
  before_action :set_resource, only: [:show, :edit]

  def index
    @properties = Property.all.order(:created_at=>:desc)
    @count = 0;
    render :layout => 'admin/layouts/application'
  end

  def new
    @property = Property.new
    render :layout => 'admin/layouts/application'
  end

  def edit
    @property = Property.find(params[:id])
    render :layout => 'admin/layouts/application'
  end

  def product_property
    @properties = Property.where(:product_id => params[:product_id]).order(:created_at=>:desc)
    render :layout => 'admin/layouts/application'
  end

  def show
    render :layout => 'admin/layouts/application'
  end

  def create
    @property = Property.new(resource_params)

    respond_to do |format|
      if @property.save
        format.html { redirect_to admin_properties_path, notice: '成功创建资源.' }
      else
        format.html { render :new }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @property = Property.find(params[:id])
    respond_to do |format|
      if @property.update(resource_params)
        format.html { redirect_to admin_properties_path, notice: '成功创建资源.' }
      else
        format.html { render 'admin/properties/edit' }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_resource
    @property = Property.find(params[:id])
  end

  def resource_params
    params.require(:property).permit(:name,:propertytype,:value,:state,:product_id)
  end

end
