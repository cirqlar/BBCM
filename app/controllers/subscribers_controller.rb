class SubscribersController < ApplicationController
  def new
    @subscriber = Subscriber.new
  end

  def create
    @subscriber = Subscriber.new(sub_params)
    if @subscriber.save
      flash[:success] = "You have successfully subscribed"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @subscriber = Subscriber.find(params[:id])
    if @subscriber.token == params[:token]
      @subscriber.destroy
      flash[:info] = "You have successfully unsubscribed"
    else
      flash[:danger] = "Invalid link"
    end
    redirect_to root_path
  end

  private
    def sub_params
      params.require(:subscriber).permit(:name, :email)
    end
end