class Subreddit < ApplicationRecord
  validates :title, presence: true
end
