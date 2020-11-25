FactoryBot.define do
  factory :user do
    nickname { "サンプルネーム" }
    email { "test@example.com" }
    password = "abcde123"
    password_confirmation { password }
    name_kanji { "久保建英" }
    name_kana { "クボタケフサ" }
  end
end

# factory :user do
#   nickname { Faker::Name.last_name }
#   email { "abcde@abc.jp" }
#   password = Faker::Internet.password(min_length: 8)
#   password_confirmation { password }
#   name_kanji { Gimei.first.kanji }
#   name_kana { Gimei.first.katakana }
# end
