class Like < ApplicationRecord
  belongs_to :deck
  belongs_to :user
  validates_uniqueness_of :deck_id, scope: :user_id
end
