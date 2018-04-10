class Work < ApplicationRecord
  has_many :votes
  validates :title, presence: true, uniqueness: true

  def self.show_spotlight
    works = self.all
    return works.max_by {|work| work.votes.count}
  end

  def self.show_albums
    works = self.all
    albums = []
    works.each do |work|
      albums << work if work.category == "album"
    end
    return albums
  end

  def self.show_books
    works = self.all
    books = []
    works.each do |work|
      books << work if work.category == "book"
    end
    return books
  end

  def self.show_movies
    works = self.all
    movies = []
    works.each do |work|
      movies << work if work.category == "movie"
    end
    return movies
  end

end
