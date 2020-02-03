class MessagesController < ApplicationController

  def create
    messsage = Message.create(message_params)

  end

  private

  def message_params 
    params.require(:message).permit(:title, :)
  end
end
