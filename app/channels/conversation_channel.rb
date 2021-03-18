class ConversationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "#{params[:topic]}"
  end
end
