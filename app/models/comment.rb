class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :event
  has_one_attached :image

  validates :text, presence: true, length: { maximum: 120, message: 'は120文字以内です' }
end
