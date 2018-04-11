class Work < ApplicationRecord
  has_many :votes

  # validates {:title, presence: true, :created_by, presence: true, :publication_date, presence: true, :category, presence: true}

  def self.all_albums
    return Work.where(category: "album")
  end

  def self.all_movies
    return Work.where(category: "movie")
  end

  def self.all_books
    return Work.where(category: "book")
  end

  def self.top_albums
    return top_albums = all_albums.limit(10)
  end

  def self.top_movies
    return top_movies = all_movies.limit(10)
  end

  def self.top_books
    return top_books = all_books.limit(10)
  end

end
