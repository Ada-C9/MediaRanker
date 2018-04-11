class Vote < ApplicationRecord
  belongs_to :works
  belongs_to :users


  def upvote
    votes += 1
    return votes
  end

end
