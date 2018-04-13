class Work < ApplicationRecord
  has_many :votes

  validates :category, presence: true
  validates :title, presence: true
  validates :title, length: { in: 1..25 }
  validates :publication_year, numericality: true
  validates :publication_year, length: { is: 4 }

  def self.top_ten_books
    Work.where(category: "book").sort_by{|book| book.votes.count}.reverse.first(10)
  end

  def self.top_ten_albums
    Work.where(category: "album").sort_by{|album| album.votes.count}.reverse.first(10)
  end

  def self.top_ten_movies
    Work.where(category: "movie").sort_by{|movie| movie.votes.count}.reverse.first(10)
  end

end
