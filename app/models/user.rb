class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   has_many :apples, dependent: :destroy

   validates :name, presence: true 
   validates :profile, length: { maximum: 200 }

   has_many :likes, dependent: :destroy
  has_many :liked_apples, through: :likes, source: :apple

  has_many :comments, dependent: :destroy

  def already_liked?(apple)
    self.likes.exists?(apple_id: apple.id)
  end

end
