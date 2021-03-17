require 'rails_helper'

describe Api::V1::Users::ConversationsController do
  describe 'index' do
    it "should display a list of all conversations" do
      user1 = FactoryBot.create(:user)
      user2 = FactoryBot.create(:user)
      user3 = FactoryBot.create(:user)

      message1 = FactoryBot.create(:message, sender: user1, recipient: user2)
      message2 = FactoryBot.create(:message, sender: user1, recipient: user2)
      message3 = FactoryBot.create(:message, sender: user1, recipient: user3)

      get "/api/v1/users/#{user1.id}/conversations"

      expect(JSON.parse(response.body)).to contain_exactly(user2.as_json, user3.as_json)
    end
  end
end
