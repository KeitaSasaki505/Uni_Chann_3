class Event < ApplicationRecord
  is_impressionable counter_cache: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  
  has_many_attached :images
  belongs_to_active_hash :genre
  belongs_to :user
  has_many :joins
  has_many :comments
  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  with_options presence: true do
    # validates :images
    validates :overview, length: { in: 1..400, message: 'は400文字以内です' }
    validates :project, length: { in: 1..50, message: 'は50文字以内です' }
    validates :address
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, format: { with: VALID_EMAIL_REGEX }
    validates :date
    VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
    validates :phone, format: { with: VALID_PHONE_REGEX }
  end

  validates :genre_id, numericality: { other_than: 0, message: 'が選択されていません' }
end
