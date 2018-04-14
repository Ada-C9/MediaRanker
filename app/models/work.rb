class Work < ApplicationRecord
  has_many :votes
  validates :category, presence: true
  validates :title, presence: true
  validates :title, uniqueness: { scope: :category, message: "That title already exists in this category." }
  validates :publication_year, numericality: true
  validates :publication_year, length: { is: 4 }

  def vote_count
    votes.count
  end

  def self.movies
    with_category('movie')
  end

  def self.books
    with_category('book')
  end

  def self.albums
    with_category('album')
  end

  def self.with_category(name)
    where(category: name)
  end

  def self.valid_categories
    %w[album movie book]
  end

  def self.top_ranked
    left_joins(:votes)
      .group(:id)
      .order('COUNT(votes.id) DESC')
  end

end
