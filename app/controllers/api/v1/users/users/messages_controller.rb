class Api::V1::Users::Users::MessagesController < ApplicationController
  def index
    user1 = User.find(params[:user_one_id])
    user2 = User.find(params[:user_two_id])

    render json: Message.conversation(user1, user2).as_json
  end

  def create
    user1 = User.find(params[:user_one_id])
    user2 = User.find(params[:user_two_id])

    message = Message.create(sender_id: user1.id, recipient_id: user2.id, body: params[:body])

    render json: message.as_json
  end
end
