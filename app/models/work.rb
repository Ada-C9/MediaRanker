class Work < ApplicationRecord
  has_many :votes

  def total_votes
    total = self.votes.count
    return total
  end



def self.top_ten
  top_ten = Work.all.order(votes: :desc, limit: 10)
  return top_ten
end

end
