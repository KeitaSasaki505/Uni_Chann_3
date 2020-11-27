FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 8)}
    password_confirmation { password }
    name_kanji { Gimei.first.kanji }
    name_kana { Gimei.first.katakana }
  end
end
