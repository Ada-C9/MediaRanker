class Work < ApplicationRecord
  has_many :votes

  def self.albums
    self.where(category: "album")

  end

  def self.books
    self.where(category: "book")

  end

  def self.movies
    self.where(category: "movie")

  end
end
