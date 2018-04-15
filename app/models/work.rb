class Work < ApplicationRecord
  has_many :votes
  validates :title, presence: true, uniqueness: true

  def self.show_spotlight
    works = self.all
    raise ArgumentError.new if works.nil?
    return works.max_by {|work| work.votes.count}
  end

  def self.show_albums
    albums = Work.where(category: "album")
    return albums.sort_by {|album| album.votes.count}.reverse!
  end

  def self.show_books
    books = Work.where(category: "book")
    return books.sort_by {|book| book.votes.count}.reverse!
  end

  def self.show_movies
    movies = Work.where(category: "movie")
    return movies.sort_by {|movie| movie.votes.count}.reverse!
  end

end
