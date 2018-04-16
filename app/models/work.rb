class Work < ApplicationRecord
  has_many :votes

  validates :title, presence: true

  def self.top_movies
    movies = Work.where(category: "movie")
    top_movies = (movies.limit(10).sort_by { |work| work.votes.count }).reverse!
    return top_movies
  end

  def self.top_books
    books = Work.where(category: "book")
    top_books = (books.limit(10).sort_by { |work| work.votes.count }).reverse!
    return top_books
  end

  def self.top_albums
    albums = Work.where(category: "album")
    top_albums = (albums.limit(10).sort_by { |work| work.votes.count }).reverse!
    return top_albums
  end

end
