class MessagesController < ApplicationController
  before_action :set_resume, except: [:index]
  before_action :set_message, only: [:show, :destroy]

  def index
    @messages = current_user.messages
  end

  def new
    @message = Message.new
  end

  def create
    @message = @resume.messages.new(message_params)
    @message.user_id = current_user.id

    if @message.save
      flash[:notice] = "Your message was successfully sent."
      redirect_to resume_messages_path
    else
      render :new
    end
  end

  def show
  end

  def destroy
    if @message.destroy
      flash[:notice] = "Your message was deleted successfully."
      redirect_to resume_messages_path
    else
      render :show
    end
  end

  private
  def message_params
    params.require(:message).permit(:subject, :recipient, :body, :resume)
  end

  def set_resume
    @resume = Resume.find(params[:resume_id])
  end

  def set_message
    @message = Message.find(params[:id])
  end
end
