class Work < ApplicationRecord
  has_many :votes

  validates :title, presence: true, uniqueness: true
  validates :category, inclusion: { in: %w(album book movie),
    message: "Could not create work" }


  def self.books
    array = Work.where(category: "book")
    new_array = array.sort_by { |item| item.votes.count }.reverse
    return new_array
  end

  def self.albums
    array = Work.where(category: "album")
    new_array = array.sort_by { |item| item.votes.count }.reverse
    return new_array
  end

  def self.movies
    array = Work.where(category: "movie")
    new_array = array.sort_by { |item| item.votes.count }.reverse
    return new_array
  end

  def self.top_books
    books.first(10)
  end

  def self.top_albums
    albums.first(10)
  end

  def self.top_movies
    movies.first(10)
  end


  def self.top_work
    self.all.sort_by{ |item| item.votes.count }.reverse.first
  end

end
