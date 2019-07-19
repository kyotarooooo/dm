class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

  def self.search(search)
    return User.all unless search
    User.where(['user_name LIKE ?', "%#{search}%"])
  end
end
