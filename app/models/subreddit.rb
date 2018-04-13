class Subreddit < ApplicationRecord
  validates :title, presence: true

  has_many :votes

end
