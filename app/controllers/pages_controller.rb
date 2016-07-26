class PagesController < ApplicationController
  def index
    @slides = Slide.all.take(5)
    @messages =  Message.where("media_processing = ?", false).take(6)
    @images = Image.all.take(6)
    @subscriber = Subscriber.new
  end

  def contact
  end

  def create
    @message = params[:pages]
    ContactMailer.contact(@message).deliver_later
    flash[:success] = "Email sent successfully"
    redirect_to contact_path
  end

  def about
  end
end
