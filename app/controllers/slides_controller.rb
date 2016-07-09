class SlidesController < ApplicationController
  before_action :get_slide, only: [:edit, :update, :destroy]

  def index
    @slides = Slide.all
  end

  def new
    @slide = Slide.new
  end

  def create
    @slide = Slide.new(slide_params)
    if @slide.save
      flash[:success] = "Slide successfully created"
      redirect_to @slide
    else
      render 'new'
    end
  end

  def edit
    render 'new'
  end

  def update
    if @slide.update_attributes(slide_params)
      flash[:success] = "Slide successfully updated"
      redirect_to @slide
    else
      render 'edit'
    end
  end

  def destroy
    @slide.destroy
    flash[:info] = "Slide successfully deleted"
    redirect_to slides_path
  end

  private
    def slide_params
      params.require(:slide).permit(:image, :title)
    end

    def get_slide
      @slide = Slide.find(params[:id])
    end
end
