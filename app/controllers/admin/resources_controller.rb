class Admin::ResourcesController < ApplicationController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]


  def global_header
    @count = 0
    @resources = Resource.where(:kind =>Resource::GLOBAL_HEADER).order(:created_at=>:desc)
    render :layout => 'admin/layouts/application'
  end

  def check
    @resource = Resource.find(params[:id].to_i)
    @resource.check=params[:check]
    if @resource.save
      redirect_to admin_resources_global_header_url,notice: '成功修改'
    else
      redirect_to admin_resources_global_header_url,notice: '修改失败'
    end
  end

  def global_body
    @count = 0
    @resources = Resource.where(:kind => Resource::GLOBAL_BODY).order(:created_at=>:desc)
    render :layout => 'admin/layouts/application'
  end

  def global_footer
    @count = 0
    @resources = Resource.where(:kind => Resource::GLOBAL_FOOTER).order(:created_at=>:desc)
    render :layout => 'admin/layouts/application'
  end

  def product
    @count = 0
    @resources = Resource.where(:kind =>Resource::PRODUCT ).order(:created_at=>:desc)
    render :layout => 'admin/layouts/application'
  end

  def product_picture
    @count = 0
    @resources = Resource.where(:kind => Resource::PRODUCT).where(:product_id => params[:id].to_i).order(:created_at=> :desc)
    render :layout => 'admin/layouts/application'
  end

  def configure
  end

  # GET /resources
  # GET /resources.json
  def index
    render :layout => 'admin/layouts/application'
  end

  # GET /resources/1
  # GET /resources/1.json
  def show
    render :layout => 'admin/layouts/application'
  end

  def new
    @resource = Resource.new
    render layout: 'admin/layouts/application'
  end

  # GET /resources/new
  def new_global
    @resource = Resource.new
    render :layout => 'admin/layouts/application'
  end

  def new_product
    @resource = Resource.new
    render :layout => 'admin/layouts/application'
  end

  # GET /resources/1/edit
  def edit
    render :layout => 'admin/layouts/application'
  end

  # POST /resources
  # POST /resources.json
  def create
    @resource = Resource.new(resource_params)

    respond_to do |format|
      if @resource.save
        format.html { redirect_to admin_resources_path, notice: '成功创建资源.' }
        format.json { render :show, status: :created, location: @resource }
      else
        format.html { render :new }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resources/1
  # PATCH/PUT /resources/1.json
  def update
    respond_to do |format|
      if @resource.update(resource_params)
        format.html { redirect_to @resource, notice: 'Resource was successfully updated.' }
        format.json { render :show, status: :ok, location: @resource }
      else
        format.html { render :edit }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resources/1
  # DELETE /resources/1.json
  def destroy
    @resource.destroy
    respond_to do |format|
      format.html { redirect_to resources_url, notice: 'Resource was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private

  def set_resource
    @resource = Resource.find(params[:id])
  end

  def resource_params
    params.require(:resource).permit(:name,:kind,:check,:description,:path,:product_id)
  end

end
