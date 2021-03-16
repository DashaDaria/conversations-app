require 'rails_helper'

describe Message do
    it 'works' do
        message = FactoryBot.create(:message, body: "New message")
        expect(message.body).to eq "New message"
        expect(message.valid?).to eq true
    end
end