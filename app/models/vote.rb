class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :instagram, optional: true
  belongs_to :twitter, optional: true
  belongs_to :subreddit, optional: true

  validates_uniqueness_of :user_id, scope: :instagram_id
validates_uniqueness_of :user_id, scope: :twitter_id
validates_uniqueness_of :user_id, scope: :subreddit_id
end
