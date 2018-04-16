class Work < ApplicationRecord
  has_many :votes

  validates :category, presence: true

  validates :creator, presence: true
  validates :title, length: { in: 1..25 }

  validates :title, presence: true
  validates :title, length: { in: 1..50 }

  def num_votes
    self.votes.length
  end

  def self.order_works(category)
    self.where(category: category).sort_by{ |work| work.num_votes }.reverse
  end
end
