class Api::V1::Users::ConversationsController  < ApplicationController

  def index
    user = User.find(params[:user_id])
    render json: User.conversations(user).as_json
  end

end
