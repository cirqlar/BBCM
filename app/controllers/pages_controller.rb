class PagesController < ApplicationController
  def index
    @slides = Slide.all.take(5)
    @ans = Announcement.all.take(5)
    @subscriber = Subscriber.new
  end

  def contact
  end

  def create
    @message = params[:pages]
    ContactMailer.contact(@message).deliver
    flash[:success] = "Email sent successfully"
    redirect_to contact_path
  end

  def about
  end
end
