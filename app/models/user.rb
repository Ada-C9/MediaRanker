class User < ApplicationRecord
  has_many :votes


  def count_vote
    sum = 0
    votes.each do
      sum+=1
    end
    return sum
  end
end
