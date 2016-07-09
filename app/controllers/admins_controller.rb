class AdminsController < ApplicationController
  before_action :logged_in_admin
  before_action :correct_admin, only: [:edit, :update, :destroy]
  before_action :get_admin, only: [:edit, :update, :destroy]

  def index
    @admins = Admin.all
  end

  def new
    @admin = Admin.new(parent_id: session[:admin_id])
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      flash[:success] = "Admin created Successfully"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    render 'new'
  end

  def update
    if @admin && @admin.authenticate(params[:admin][:password])
      params[:admin][:password] = ""
      if @admin.update_attributes(admin_params)
        flash[:success] = "Admin edited Successfully"
        redirect_to root_path
      else
        render "new"
      end
    else
      flash.now[:danger] = "Wrong Password"
      render "new"
    end
  end

  private
    def admin_params
      params.require(:admin).permit(:name, :email, :password, :password_confirmation, :parent_id)
    end

    def get_admin
      @admin = Admin.find(params[:id])
    end
end
