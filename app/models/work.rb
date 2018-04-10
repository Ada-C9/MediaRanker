class Work < ApplicationRecord
  has_many :votes

  def total_votes
    total = self.votes.count
    return total
  end

end
