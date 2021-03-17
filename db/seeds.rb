puts "seeding the initial database"
user1 = FactoryBot.create(:user, name: "Dasha")

user2 = FactoryBot.create(:user)
user3 = FactoryBot.create(:user)
user4 = FactoryBot.create(:user)
user5 = FactoryBot.create(:user)
user6 = FactoryBot.create(:user)

message1 = FactoryBot.create(:message, sender: user1, recipient: user2)
message2 = FactoryBot.create(:message, sender: user1, recipient: user3)
message3 = FactoryBot.create(:message, sender: user1, recipient: user2)
message4 = FactoryBot.create(:message, sender: user2, recipient: user3)
message5 = FactoryBot.create(:message, sender: user2, recipient: user3)
message6 = FactoryBot.create(:message, sender: user3, recipient: user1)
message7 = FactoryBot.create(:message, sender: user3, recipient: user1)
