class Work < ApplicationRecord
  has_many :votes
  validates :title, presence: true
  validates :category, presence: true


  def self.books
    a = Work.where(category: "book")
    b = a.sort_by {|item| item.votes.count}.reverse
    return b
  end

  def self.albums
    a = Work.where(category: "album")
    b = a.sort_by {|item| item.votes.count}.reverse
    return b
  end

  def self.movies
    a = Work.where(category: "movie")
    b = a.sort_by {|item| item.votes.count}.reverse
    return b
  end

  def self.top_ten_books
    books.first(10)
  end

  def self.top_ten_albums
    albums.first(10)
  end

  def self.top_ten_movies
    movies.first(10)
  end

  def self.spotlight
    self.all.sort_by{|item| item.votes.count}.reverse.first
  end

end
