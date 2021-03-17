FactoryBot.define do
  factory :message do
    body { Faker::Quote.famous_last_words }
    association :sender, factory: :user
    association :recipient, factory: :user
  end
end
