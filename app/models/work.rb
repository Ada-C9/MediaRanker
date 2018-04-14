class Work < ApplicationRecord
  validates :title, presence: true, uniqueness: { scope: :category }, length: { minimum: 1 }
  has_many :votes, dependent: :destroy

  def total_votes
    return self.votes.count
  end

  def self.sorted_list(category)
    works = Work.all.where(category: category).to_a
    return works.sort_by { |work| -work.total_votes }
  end

  def self.top_10(category)
    return Work.sorted_list(category)[0..9]
  end

  def self.top_1
    works = Work.all.to_a
    return works.max_by { |work| work.total_votes }
  end

end
