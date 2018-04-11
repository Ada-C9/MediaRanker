class Work < ApplicationRecord
  validates :title, presence: true, uniqueness: { scope: :category }
  has_many :votes, dependent: :destroy

  def total_votes
    return self.votes.count
  end
end
