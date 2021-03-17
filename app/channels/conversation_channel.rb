class ConversationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "conversation#{params[:user_id]}"
end
end
