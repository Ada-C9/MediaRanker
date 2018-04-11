class Vote < ApplicationRecord
  belongs_to :work, counter_cache: :vote_count
  belongs_to :user

  validates :user, uniqueness: { scope: :work, message: "has already voted for this work." }
end
