class Join < ApplicationRecord
  belongs_to :event
  belongs_to :user


  with_options presence: true do
    validates :email
    validates :phone
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'Full-width characters' } do
    validates :name_kanji
  end

  with_options presence: true, format: { with: /\A[ァ-ン]+\z/, message: 'Full-width katakana characters' } do
    validates :name_kana
  end
end
