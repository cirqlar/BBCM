class ImagesController < ApplicationController
  before_action :logged_in_admin, only: [:new, :create, :edit, :update, :destroy]
  before_action :get_image, only: [:show, :edit, :update, :destroy]

  def index
    @images = Image.paginate(page: params[:page], per_page: 10)

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    respond_to do |format|
      format.html
      format.js
    end
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
    render 'new'
  end

  def update
    if @image.update_attributes(image_params)
      flash[:success] = "Image successfully updated"
      redirect_to gallery_path
    else
      render 'edit'
    end
  end

  def destroy
    @image.destroy
    flash[:info] = "Image deleted"
    redirect_to gallery_path
  end

  private
    def image_params
      params.require(:image).permit(:event,:people,:image)
    end

    def get_image
      @image = Image.find(params[:id])
    end
end
