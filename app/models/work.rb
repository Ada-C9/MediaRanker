class Work < ApplicationRecord
  has_many :votes, dependent: :destroy
  has_many :users, through: :votes

  validates :category, presence: true
  validates :title, presence: true, uniqueness: { scope: :category }

  def self.ordered_exclusive
    self.joins(:votes).group(:id).order('COUNT(votes.id) DESC')
  end

  def self.ordered_inclusive
    self.left_outer_joins(:votes).group(:id).order('COUNT(votes.id) DESC')
  end

  def self.top_work
    self.ordered_exclusive.first
  end

  def self.albums
    self.where(category: :album)
  end

  def self.books
    self.where(category: :book)
  end

  def self.movies
    self.where(category: :movie)
  end

  def self.top_ten
    self.limit(10)
  end
end
