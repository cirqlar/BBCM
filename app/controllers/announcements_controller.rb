class AnnouncementsController < ApplicationController
  before_action :get_an, only: [:show, :edit, :update, :destroy]

  def index
    @ans = Announcement.all
  end

  def show
  end

  def new
    @an = Announcement.new
  end

  def create
    @an = Announcement.new(an_params)
    if @an.save
      flash[:success] = "Announcement successfully created"
      redirect_to @an
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @an.update_attributes(an_params)
      flash[:success] = "Announcement successfully updated"
      redirect_to @an
    else
      render 'edit'
    end
  end

  def destroy
    @an.destroy
    flash[:info] = "Announcement successfully deleted"
    redirect_to announcements_path
  end

  private
    def an_params
      params.require(:announcement).permit(:title, :desc, :expires_at)
    end

    def get_an
      @an = Announcement.find(params[:id])
    end
end
