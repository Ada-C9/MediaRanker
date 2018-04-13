class Subreddit < ApplicationRecord
  validates :title, presence: true

  has_many :votes
  has_many :users, through: :votes
end
