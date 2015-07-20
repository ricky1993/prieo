class Admin::UsersController < ApplicationController
  def index
    @users=User.all
    @count=0
    render :layout => 'admin/layouts/application'
  end

  def new
    render :layout => 'admin/layouts/application'
  end



  def edit

    render :layout => 'admin/layouts/application'
  end

  def show
    set_user
    render :layout => 'admin/layouts/application'
  end

  def delete
    User.find(params[:id]).destroy
    redirect_to controller:'admin/users',action:'index'
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.require(:user).permit(:title, :description, :image_url, :price,:designer)
  end

end
