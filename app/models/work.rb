class Work < ApplicationRecord
  has_many :votes

  def self.albums
    Work.where(id: "album")

  end

  def self.books
    Work.where(id: "book")

  end

  def self.movies
    Work.where(id: "movie")

  end
end
