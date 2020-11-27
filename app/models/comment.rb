class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :event

  validates :text, presence: true, length: { maximum: 120, message: 'は120文字以内です' }
end
