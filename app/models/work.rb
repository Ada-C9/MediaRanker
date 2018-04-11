class Work < ApplicationRecord
  has_many :votes

  def self.books
    works = Work.all
    books = []
    works.each do |work|
      if work.category == "book"
        books << work
      end
    end
    return books
  end

  def self.albums
    works = Work.all
    albums = []
    works.each do |work|
      if work.category == "album"
        albums << work
      end
    end
    return albums
  end

  def self.movies
    works = Work.all
    movies = []
    works.each do |work|
      if work.category == "movie"
        movies << work
      end
    end
    return movies
  end
end
