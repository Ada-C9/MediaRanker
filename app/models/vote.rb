class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :instagram, optional: true
  belongs_to :twitter, optional: true
  belongs_to :subreddit, optional: true 
end
