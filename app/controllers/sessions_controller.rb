class SessionsController < ApplicationController
  before_action :logged_in_admin, only: [:destroy]
  
  def new
  end

  def create
    admin = Admin.find_by(email: params[:session][:email].downcase)
    if admin && admin.authenticate(params[:session][:password])
      log_in admin
      flash[:success] = "Login successful"
      redirect_to root_path
    else
      flash.now[:danger] = "Invalid details"
      render 'new'
    end
  end

  def destroy
    log_out
    flash[:info] = "You have logged out."
    redirect_to root_path
  end
end
