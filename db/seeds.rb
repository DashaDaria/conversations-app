puts 'seeding the initial database'
user1 = FactoryBot.create(:user, name: 'Dasha')

user2 = FactoryBot.create(:user)
user3 = FactoryBot.create(:user)

50.times do
  FactoryBot.create(:message, sender: user1, recipient: user2, created_at: rand(0..60).days.ago)
end

60.times do
  FactoryBot.create(:message, sender: user2, recipient: user1, created_at: rand(0..60).days.ago)
end

20.times do
  FactoryBot.create(:message, sender: user1, recipient: user3, created_at: rand(0..60).days.ago)
end

80.times do
  FactoryBot.create(:message, sender: user3, recipient: user1, created_at: rand(0..60).days.ago)
end
