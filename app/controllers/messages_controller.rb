class MessagesController < ApplicationController

  def create
    message = Message.create(message_params)

    if message.valid? 
      render json: message
    else 
      render json: { errors: message.errors.full_messages }, status: :not_acceptable
    end
  end 

  def update
    message = Message.find(message_params[:id])

    if message 
      message.update(message_update_params)
      render json: message
    else
      render json: { errors: message.errors.full_messages }, status: :not_acceptable
    end
  end 

  def index 
    messages = Message.all 
    render json: messages 
  end
  private

  def message_params 
    params.require(:message).permit(:id,:title, :content, :recipient_id, :read, :sender_delete, :receiver_delete).merge(sender: @current_user)
  end

  def message_update_params
    params.require(:message).permit(:title, :content, :read, :sender_delete, :receiver_delete)
  end
end
