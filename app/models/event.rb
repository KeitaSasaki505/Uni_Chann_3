class Event < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  
  has_many_attached :images
  belongs_to_active_hash :genre
  belongs_to :user
  has_many :joins
  has_many :comments

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  with_options presence: true do
    validates :overview
    validates :project
    validates :date
    validates :address
    validates :email
    validates :phone
  end

  validates :genre_id, numericality: { other_than: 0 }

  def self.search(search)
    if search != ""
      Event.where('project LIKE(?)', "%#{search}%")
    else
      Event.all
    end
  end
end
