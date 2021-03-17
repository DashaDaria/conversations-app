require 'rails_helper'

describe Api::V1::Users::Users::MessagesController do
  describe '#index' do
    it "should display a list of all conversations" do
      user1 = FactoryBot.create(:user)
      user2 = FactoryBot.create(:user)
      user3 = FactoryBot.create(:user)

      message1 = FactoryBot.create(:message, sender: user1, recipient: user2)
      message2 = FactoryBot.create(:message, sender: user1, recipient: user2)
      message3 = FactoryBot.create(:message, sender: user1, recipient: user3)

      get "/api/v1/users/#{user1.id}/users/#{user2.id}/messages"

      expect(JSON.parse(response.body)).to contain_exactly(message1.as_json, message2.as_json)
    end
  end

  describe '#create' do
    it "should display a list of all conversations" do
      user1 = FactoryBot.create(:user)
      user2 = FactoryBot.create(:user)

      post "/api/v1/users/#{user1.id}/users/#{user2.id}/messages", params: {body: "hello there"}

      expect(response.status).to eq 200
      expect(JSON.parse(response.body)).to eq(Message.last.as_json)

    end
  end

end
