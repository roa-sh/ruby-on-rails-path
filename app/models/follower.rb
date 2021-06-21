class Follower < ApplicationRecord
  validates :user_id, presence: true
  validates :following, presence: true

end
