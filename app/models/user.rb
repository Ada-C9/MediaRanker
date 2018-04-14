class User < ApplicationRecord
  has_many :votes,dependent: :destroy
  validates :username, presence: {message: "You need to provide a username" }
  validates :date_joined,presence: true
  validates :username, uniqueness:true



  def count_vote
    sum = 0
    votes.each do
      sum+=1
    end
    return sum
  end
end
