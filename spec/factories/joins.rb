FactoryBot.define do
  factory :join do
    association :user
    association :event
    email { Faker::Internet.free_email}
    phone { Faker::Number.number(digits: 11) }
    name_kanji { Gimei.first.kanji }
    name_kana { Gimei.first.katakana }
    message { Faker::Lorem.characters }
  end
end
