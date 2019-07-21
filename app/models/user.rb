class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

  has_many :decks, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liked_decks, through: :likes, source: :deck

  def self.search(search)
    return User.all unless search
    User.where(['user_name LIKE ?', "%#{search}%"])
  end

  def already_liked?(deck)
    self.likes.exists?(deck_id: deck.id)
  end
end
