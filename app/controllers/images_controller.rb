class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      flash[:success] = "Image successfully created"
      redirect_to gallery_path
    else
      render 'new'
    end
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    if @image.update_attributes(image_params)
      flash[:success] = "Image successfully updated"
      redirect_to gallery_path
    else
      render 'edit'
    end
  end

  def destroy

  end

  private
    def image_params
      params.require(:image).permit(:event,:people,:image)
    end
end
