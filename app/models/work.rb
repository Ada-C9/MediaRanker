class Work < ApplicationRecord
  has_many :votes

  validates :title, presence: true, uniqueness: true
  validates :creator, presence: true
  validates :publication_year, presence: true

  def self.show_books
    books = Work.where(category: "book")
    return books.sort_by { |book| book.votes.count }.reverse
  end

  def self.show_movies
    movies = Work.where(category: "movie")

    return movies.sort_by { |movie| movie.votes.count }.reverse
  end

  def self.show_albums
    albums = Work.where(category: "album")

    return albums.sort_by { |album| album.votes.count }.reverse
  end

  def self.spotlight
    sorted_works = Work.all.sort_by { |work| work.votes.count }.reverse
    return sorted_works.first
  end

  def self.top_ten_movies
    sorted_works = Work.where(category: "movie").sort_by { |movie| movie.votes.count }.reverse
    sorted_works[0...10]
  end

  def self.top_ten_books
    sorted_works = Work.where(category: "book").sort_by { |book| book.votes.count }.reverse
    sorted_works[0...10]
  end

  def self.top_ten_albums
    sorted_works = Work.where(category: "album").sort_by { |album| album.votes.count }.reverse
    sorted_works[0...10]
  end
end
