require 'rails_helper'

describe User do
    it 'works' do
        user = FactoryBot.create(:user, name: "Dasha")
        expect(user.name).to eq "Dasha"
        expect(user.valid?).to eq true
    end

    describe '.conversations' do
        it 'returns a list of other users that a given user has been messaging' do
            user1 = FactoryBot.create(:user)
            user2 = FactoryBot.create(:user)
            user3 = FactoryBot.create(:user)

            message1 = FactoryBot.create(:message, sender: user1, recipient: user2)
            message2 = FactoryBot.create(:message, sender: user1, recipient: user2)
            message3 = FactoryBot.create(:message, sender: user1, recipient: user3)
            message4 = FactoryBot.create(:message, sender: user2, recipient: user3)

            expect(User.conversations(user1).pluck(:id)).to contain_exactly(user2.id, user3.id)
        end
    end
end
