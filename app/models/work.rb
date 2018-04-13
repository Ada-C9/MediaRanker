class Work < ApplicationRecord
  has_many :votes
  has_many :users, through: :votes

  validates :category, presence: { message: "You must choose a category" }

  validates :title, presence: { message: "Title can't be blank" }

  def self.all_movies
    where(category: "movie")
  end

  def self.all_books
    where(category: "book")
  end

  def self.all_albums
    where(category: "album")
  end

  def self.media_spotlight
    all.sort_by{ |w| w.votes.count }.last
  end

  def self.top_movies
    where(category: "movie").sort_by{ |m| m.votes.count }.last(10)
  end

  def self.top_books
    where(category: "book").sort_by{ |b| b.votes.count }.last(10)
  end

  def self.top_albums
    where(category: "album").sort_by{ |a| a.votes.count }.last(10)
  end

end
