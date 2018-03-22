class AudioController < ApplicationController
  before_action :logged_in_admin, only: [:new, :create, :edit, :update, :destroy]
  before_action :get_audio, only: [:show, :edit, :update, :destroy]

  def index
    @audio = Audio.all

    if params[:type] && params[:type] != ""
      @audio = @audio.where("content_type = ?", params[:type])
    end

    if params[:tag] && params[:tag] != ""
      @audio = @audio.tagged_with(params[:tag])
    end

    @audio = @audio.paginate(page: params[:page], per_page: 10)

    respond_to do |format|
      format.html { @audio = Audio.where("media_processing = ?", false).first }
      format.js
    end
  end

  def show
    @audio = Audio.find(params[:id])

    respond_to do |format|
      format.html do
        @audio = Audio.paginate(page: params[:page], per_page: 10)
        render 'index'
      end
      format.js
    end
  end

  def new
    @audio = Audio.new
  end

  def create
    @audio = Audio.new(audio_params)
    if @audio.save
      flash[:success] = "Audio successfully saved"
      redirect_to show_audio_path(:id => @audio)
    else
      render 'new'
    end
  end

  def edit
    render 'new'
  end

  def update
    if @audio.update_attributes(audio_params)
      flash[:success] = "Audio successfully updated"
      redirect_to show_audio_path(:id => @audio)
    else
      render 'edit'
    end
  end

  def destroy
    @audio.destroy
    flash[:info] = "Audio deleted"
    redirect_to audios_path
  end

  private
    def audio_params
      params.require(:audio).permit(:media, :title, :description, :poster, :tag_list)
    end

    def get_audio
      @audio = Audio.find(params[:id]) if params[:id]
    end
end
