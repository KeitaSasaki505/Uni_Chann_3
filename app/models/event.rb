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
    validates :overview
    validates :project
    validates :address
    validates :email
    validates :images
    validates :date
    validates :phone, format: { with: /\A[0-9]+\z/ }
  end

  validates :genre_id, numericality: { other_than: 0 }

end
