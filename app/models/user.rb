class User < ApplicationRecord
  has_many :votes

  def total_user_votes
    total = self.votes.count
    return total
  end
end
