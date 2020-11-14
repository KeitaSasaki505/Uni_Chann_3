class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image
  has_many :events, dependent: :destroy
  has_many :comments
  has_many :joins
  has_many :likes, dependent: :destroy
  has_many :liked_events, through: :likes, source: :event

  with_options presence: true do
    validates :nickname
    validates :name_kanji, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: '全角で入力してください' }
    validates :name_kana, format: { with: /\A[ァ-ン]+\z/, message: '全角カタカナで入力してください' }
    validates :email, uniqueness: true
    validates :password, length: { minimum: 8 }
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: '文字と数字を含めたパスワードにしてください'
  end

  def self.guest
    find_or_create_by!(email: 'test@test.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end
        
  def active_for_authentication?
    super && (self.is_deleted == false)
  end

  def already_liked?(event)
    self.likes.exists?(event_id: event.id)
  end
end
