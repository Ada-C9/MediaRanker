class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { minimum: 1 }
  has_many :votes, dependent: :destroy

  def total_votes
    return self.votes.count
  end
end
