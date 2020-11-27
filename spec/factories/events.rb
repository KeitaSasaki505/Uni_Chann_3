FactoryBot.define do
  factory :event do
    association :user
    overview { Faker::Lorem.characters(number: 400) }
    project { Faker::Lorem.characters(number: 50) }
    address { Gimei.address.kanji }
    email { Faker::Internet.free_email }
    date { Faker::Date.between(from: '2020-11-25', to: '2025-12-31')}
    phone { Faker::Number.number(digits: 11) }
    genre_id { Faker::Number.between(from: 1, to: 8) }
  end
end