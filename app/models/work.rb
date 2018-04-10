class Work < ApplicationRecord
  has_many :votes
  has_many :voted_users, through: :votes, source: :user

  def self.books
    Work.where(category: "book")
  end

  def self.movies
    Work.where(category: "movie")
  end

  def self.albums
    Work.where(category: "album")
  end
end
