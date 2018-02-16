class Chatroom < ApplicationRecord
  belongs_to :user
  has_many :chat_messages

  after_save :send_greeting

  def unread_messages
    # Could lead to an awesome service
    "None"
  end

  def send_greeting
    ChatMessage.create(user: User.find(1), chatroom: self, body: greeting)
  end

  def greeting
    "Hello, Welcome to Found Sound. Let me know if you need any help"
  end
end
