class Work < ApplicationRecord
  has_many :votes

  validates :title, presence: true, uniqueness: true
  validates :creator, presence: true
  validates :publication_year, presence: true

  def self.show_books
    books = Work.where(category: "book")
    return books.sort { |book| book.votes.count }.reverse
  end

  def self.show_movies
    movies = Work.where(category: "movie")

    return movies.sort { |movie| movie.votes.count }.reverse
  end

  def self.show_albums
    albums = Work.where(category: "album")

    return albums.sort { |album| album.votes.count }.reverse
  end

  def self.spotlight
  end
end
