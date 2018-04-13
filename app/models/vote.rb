class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :instagram
  belongs_to :twitter
  belongs_to :subreddit 
end
