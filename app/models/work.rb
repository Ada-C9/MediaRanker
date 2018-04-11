class Work < ApplicationRecord
  has_many :votes

  def total_votes
    total = self.votes.count
    return total
  end

def top_ten(works)
  top_ten = works.all.order(votes: :desc, limit: 10)
end

end
