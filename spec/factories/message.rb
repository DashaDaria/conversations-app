
FactoryBot.define do
    factory :message do
        body { Faker::Lorem.sentence }
        association :sender, factory: :user
        association :recipient, factory: :user
    end
end
