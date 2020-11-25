FactoryBot.define do
  factory :comment do
    association :user
    association :event
    text { Faker::Lorem.characters }
  end
end
