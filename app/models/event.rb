class Event < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  
  has_one_attached :image
  belongs_to_active_hash :genre
  belongs_to :user
  has_many :joins
  has_many :comments
  
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :genre_id, numericality: { other_than: 0 }
end
