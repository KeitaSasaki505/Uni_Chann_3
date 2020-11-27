class Join < ApplicationRecord
  belongs_to :event
  belongs_to :user


  with_options presence: true do
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, {format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }}
    VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
    validates :phone, format: { with: VALID_PHONE_REGEX }
    validates :name_kanji, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}\s|[ー－]|[一-龠々])+\z/, message: 'は全角で入力してください' }
    validates :name_kana, format: { with: /\A[ァ-ン]+\z/, message: 'は全角カナで入力してください' }
  end

  validates :message, length: { maximum: 400, message: 'は400文字以内です' }

end
