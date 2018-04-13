class Work < ApplicationRecord
  has_many :votes

  validates_presence_of :title, :category

  validates :title, uniqueness: { scope: :category, message: "Cannot have the same title within the same media type" }

  def vote_count
    self.votes.count
  end

  def self.ordered_by_votes_works(category)
    works = Work.all.where(category: category).to_a
    return works.sort_by {|work| -work.vote_count}
  end

  def self.top_ten(category)
    return Work.ordered_by_votes_works(category)[0..9]
  end

  def self.best_work
    works = Work.all.to_a
    return works.max_by {|work| work.vote_count}
  end


end
