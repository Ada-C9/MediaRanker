class Work < ApplicationRecord
  has_many :votes

  def self.albums
    Work.where(category: "album")

  end

  def self.books
    Work.where(category: "book")

  end

  def self.movies
    Work.where(category: "movie")

  end
end
