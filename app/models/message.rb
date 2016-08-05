class Message < ApplicationRecord
  belongs_to :chatroom
  after_commit :broadcast, on: [:create]

  def broadcast
    ActionCable.server.broadcast 'messages',
      content: self.content,
      user: self.user
  end
end
