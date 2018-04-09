class Work < ApplicationRecord
  def self.books
    Work.where(format: "book")
  end

  def self.movies
    Work.where(format: "movie")
  end

  def self.albums
    Work.where(format: "album")
  end
end
