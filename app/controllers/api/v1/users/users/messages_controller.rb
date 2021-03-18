class Api::V1::Users::Users::MessagesController < ApplicationController
  def index
    user1 = User.find(params[:user_one_id])
    user2 = User.find(params[:user_two_id])
    messages = Message.conversation(user1, user2)
    if params[:filter] == 'last30'
      messages.where('created_at >= ?', 30.days.ago)
    else
      messages.last(100)
    end
    render json: messages.order(id: :desc).as_json
  end

  def create
    user1 = User.find(params[:user_one_id])
    user2 = User.find(params[:user_two_id])
    message = Message.create!(sender_id: user1.id, recipient_id: user2.id, body: params[:body])

    ActionCable.server.broadcast("conversation_#{user2.id}", { from: user1.name, body: message.body, timestamp: message.created_at })

    render json: message.as_json
  end
end
