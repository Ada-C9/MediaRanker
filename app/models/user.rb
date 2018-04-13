class User < ApplicationRecord
  has_many :votes
  validates :username, presence: true
  validates :date_joined, presence: true



  def count_vote
    sum = 0
    votes.each do
      sum+=1
    end
    return sum
  end
end
