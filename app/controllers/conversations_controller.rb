class ConversationsController < ApplicationController
  def index
    @user = User.first
    @conversations = User.conversations(@user)
  end

  def show
    @user1 = User.first
    @user2 = User.find(params[:user_id])

    messages = Message.conversation(@user1, @user2)

    if params[:filter] == 'last30'
      @messages = messages.where('created_at >= ?', 30.days.ago).order(created_at: :desc)
    else
      @messages = messages.order(created_at: :desc).limit(100)
    end
  end
end
