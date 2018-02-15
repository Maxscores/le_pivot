class ChatController < ApplicationController
  def create
    current_user.chat_messages.new(chat_message_params)
  end

  private
    def chat_message_params
      params.require(:chat_message).permit(:chatroom_id, :body)
    end
end
