class Work < ApplicationRecord

  validates :title, :creator, presence: true


  def self.books
    books = []
    works = Work.all
    works.each do |work|
      if work.category == "book"
        books << work
      end
    end
    return books
  end

  def self.albums
    albums = []
    works = Work.all
    works.each do |work|
      if work.category == "album"
        albums << work
      end
    end
    return albums
  end

  def self.movies
    movies = []
    works = Work.all
    works.each do |work|
      if work.category == "movie"
        movies << work
      end
    end
    return movies
  end

end
