class ConversationsController < ApplicationController

  def index
    user = User.first
    @conversations = User.conversations(user)
  end

  def show
    @user1 = User.first
    @user2 = User.find(params[:user_id])

    @messages = Message.conversation(@user1, @user2)

  end
end
