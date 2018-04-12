class Work < ApplicationRecord
  validates :title, presence: true, uniqueness: { scope: :category }
  has_many :votes, dependent: :destroy

  def total_votes
    return self.votes.count
  end

  def self.top_10(category)
    works = Work.all.where(category: category).limit(10).to_a
    return works.sort_by { |work| -work.total_votes }
  end

  def self.top_1
    works = Work.all.to_a
    return works.max_by { |work| work.total_votes }
  end

end
