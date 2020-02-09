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
    message = Message.find(params[:id])

    if message 
      message.update(read: message_params[:read])
      render json: message
    else
      render json: { errors: message.errors.full_messages }, status: :not_acceptable
    end
  end 

  private

  def message_params 
    params.require(:message).permit(:title, :content, :recipient_id, :read).merge(sender: @current_user)
  end
end
