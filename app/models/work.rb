class Work < ApplicationRecord
  has_many :votes

  def total_votes
    total = self.votes.count
    return total
  end



def self.order_by_vote
  all = Work.all.sort_by{|work| work.votes.count}.reverse

  return all
end

end
