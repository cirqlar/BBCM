class PasswordResetsController < ApplicationController
  def new
  end

  def create
    @admin = Admin.find_by(email: params[:password_reset][:email].downcase)
    if @admin
      @admin.reset_t
      @admin.send_reset
      flash[:success] = "Reset email has been sent."
      redirect_to root_path
    else
      flash[:danger] = "Email is not valid"
      render 'new'
    end
  end

  def edit
    @admin = Admin.find_by(email: params[:email])
    unless @admin && @admin.reset_digest == params[:id] && !@admin.expired?
      flash[:danger] = "The reset url is invalid or has expired."
      redirect_to new_password_reset_path
    end
  end

  def update
    @admin = Admin.find_by(email: params[:email])
    unless @admin && @admin.reset_digest == params[:id] && !@admin.expired?
      flash[:danger] = "The reset url is invalid or has expired."
      redirect_to new_password_reset_path
    end
    if params[:admin][:password].blank?
      flash.now[:danger] = "Password can't be blank"
      render 'edit'
    elsif @admin.update_attributes(admin_params)
      flash[:success] = "Password has been reset. Please log in."
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private
    def admin_params
      params.require(:admin).permit(:password, :password_confirmation)
    end
end
