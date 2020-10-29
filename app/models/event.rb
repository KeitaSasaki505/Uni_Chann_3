class Event < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to :user
  has_many :joins
  belongs_to_active_hash :genre
  has_many :comments
  has_many :joins
  has_one_attached :image
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :title, :text, :genre, presence: true
  validates :genre_id, numericality: { other_than: 0 }
end
