class Work < ApplicationRecord
  has_many :votes, dependent: :destroy

  validates :title, presence: true
  validates :category, presence: true

  def self.spotlight
    works = Work.all.to_a
    return works.max_by { |work| work.total_votes }
  end

  def self.sorted_list(category)
    works = Work.all.where(category: category).to_a
    return works.sort_by { |work| -work.total_votes }
  end

  def total_votes
    self.votes.count
  end


end
