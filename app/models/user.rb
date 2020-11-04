class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        has_one_attached :image
        has_many :events
        has_many :comments

  
        
  def active_for_authentication?
    super && (self.is_deleted == false)
  end
end
