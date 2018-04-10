class User < ApplicationRecord
  has_many :votes
  validates :username, presence: true, uniqueness: true

  def total_votes
    total = self.votes.count
    return total
  end
end
