class Join < ApplicationRecord
  belongs_to :event
  belongs_to :user


  # with_options presence: true do
  #   validates :email
  #   validates :phone, format: { with: /\A[0-9]+\z/ }
  #   validates :name_kanji, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: 'Full-width characters' }
  #   validates :name_kana, format: { with: /\A[ァ-ン]+\z/, message: 'Full-width katakana characters' }
  # end

end
