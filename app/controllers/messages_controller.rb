class MessagesController < ApplicationController
  before_action :logged_in_admin, only: [:new, :create, :edit, :update, :destroy]
  before_action :get_message, only: [:show, :edit, :update, :destroy]

  def index
    @messages.where("media_processing = ?", false)

    if params[:type] && params[:type] != ""
      @messages = @messages.where("content_type = ?", params[:type])
    end

    if params[:tag] && params[:tag] != ""
      @messages = @messages.tagged_with(params[:tag])
    end

    @messages = @messages.paginate(page: params[:page], per_page: 10)

    respond_to do |format|
      format.html { @message = Message.first }
      format.js
    end
  end

  def show
    @message ||= Message.where("media_processing = ?", false).first

    respond_to do |format|
      format.html do
        @messages = Message.paginate(page: params[:page], per_page: 10)
        render 'index'
      end
      format.js
    end
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:success] = "Message successfully saved"
      redirect_to show_message_path(:id => @message)
    else
      render 'new'
    end
  end

  def edit
    render 'new'
  end

  def update
    if @message.update_attributes(message_params)
      flash[:success] = "Message successfully updated"
      redirect_to show_message_path(:id => @message)
    else
      render 'edit'
    end
  end

  def destroy
    @message.destroy
    flash[:info] = "Message deleted"
    redirect_to messages_path
  end

  private
    def message_params
      params.require(:message).permit(:media, :title, :description, :poster, :tag_list)
    end

    def get_message
      @message = Message.find(params[:id]) if params[:id]
    end
end
