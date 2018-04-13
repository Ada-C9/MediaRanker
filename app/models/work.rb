class Work < ApplicationRecord
  has_many :votes

  validates :category, presence: {message: "Must provide a category"}

  validates :title, presence: {message: "Please provide a title"}
  validates :title, uniqueness: {scope: :category, message: "Work already exists, in this category" }


  def self.valid_category
    %w[album book movie]
  end

  def vote_count
    self.votes.count
  end

  def self.ordered_works(category)
    works = Work.all.where(category: category).to_a
    return works.sort_by {|work| -work.vote_count}
  end

  def self.top_ten(category)
    return Work.ordered_works(category)[0..9]
  end

  def self.media_spotlight
    works = Work.all.to_a
    return works.max_by {|work| work.vote_count}
  end

end
