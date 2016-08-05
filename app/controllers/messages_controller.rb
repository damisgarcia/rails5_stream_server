class MessagesController < ApplicationController
  def index
  end

  def create
    message = Message.new(message_params)
    if message.save
      ActionCable.server.broadcast 'messages',
        content: message.content,
        user: message.user

      redirect_to message.chatroom, notice: 'Message was successfully created.'
    end
  end

  private
  def message_params
    params.require(:message).permit(:user, :content, :chatroom_id)
  end
end
