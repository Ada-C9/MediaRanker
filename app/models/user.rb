class User < ApplicationRecord
  has_many :votes
  validates :user_name, presence: true, uniqueness: true

  def total_votes
    self.votes.count
  end

end
