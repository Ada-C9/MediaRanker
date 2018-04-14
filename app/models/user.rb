class User < ApplicationRecord
  has_many :votes, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: true, length: { minimum: 1 }

  def total_votes
    return self.votes.count
  end
end
