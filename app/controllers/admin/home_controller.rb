class Admin::HomeController < ApplicationController

  def index
    render :layout => 'admin/layouts/application'
  end


  def about
    render :layout => 'admin/layouts/application'
  end

  def help
    render :layout => 'admin/layouts/application'
  end

  def user
    @user = current_user
    render :layout => 'admin/layouts/application'
  end

  def contact_us
    render :layout => 'admin/layouts/application'
  end

  def login
    render :layout =>false

  end

end
