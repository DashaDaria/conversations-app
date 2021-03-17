require 'rails_helper'

describe Message do
    it 'works' do
        message = FactoryBot.create(:message, body: "New message")
        expect(message.body).to eq "New message"
        expect(message.valid?).to eq true
    end
    describe '.conversation' do
        it 'returns messages between two users' do
            user1 = FactoryBot.create(:user)
            user2 = FactoryBot.create(:user)
            user3 = FactoryBot.create(:user)

            message1 = FactoryBot.create(:message, sender: user1, recipient: user2)
            message2 = FactoryBot.create(:message, sender: user1, recipient: user2)
            message3 = FactoryBot.create(:message, sender: user1, recipient: user3)

            expect(Message.conversation(user1, user2).pluck(:id)).to contain_exactly(message1.id, message2.id)

        end
    end

end
