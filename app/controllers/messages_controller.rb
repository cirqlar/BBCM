class MessagesController < ApplicationController
  before_action :get_message, only: [:show, :edit, :update, :destroy]

  def index
    if params[:type]
      @messages = Message.where("content_type = ?", params[:type])
    else
      @messages = Message.all
    end

    if params[:tag]
      @messages = @messages.tagged_with(params[:tag])
    end
  end

  def show
    @message = Message.last unless @message
    @messages = Message.all
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
