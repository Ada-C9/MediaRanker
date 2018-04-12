class Work < ApplicationRecord
  has_many :votes
  has_many :users, through: :votes

  validates :category, presence: :true
  validates :title, presence: :true, uniqueness: :true

  def self.top_albums
    albums = self.where(category: :album)
    top_albums = albums.sort_by(&:total_votes).reverse.first(10)
    return top_albums
  end

  def self.top_books
    books = self.where(category: :book)
    top_books = books.sort_by(&:total_votes).reverse.first(10)
    return top_books
  end

  def self.top_movies
    movies = self.where(category: :movie)
    top_movies = movies.sort_by(&:total_votes).reverse.first(10)
    return top_movies
  end

  def self.top_work
    top_work = Work.all.max_by do |work|
      work.votes.count
    end
    return top_work
  end

  def total_votes
    self.votes.count
  end
end
