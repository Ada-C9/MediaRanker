class Vote < ApplicationRecord
  belongs_to :work, counter_cache: :vote_count
  belongs_to :user

  validates :user, uniqueness: { scope: :work, message: "has already voted for this work." }

  def similar_score
    # -- send all users who voted on this work to user method
    User.vote_distance(work.voted_users)
    #-- request array of works
  end

end
