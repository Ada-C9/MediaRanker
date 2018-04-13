class Work < ApplicationRecord
  has_many :votes
  has_many :works, :through => :votes

  validates :title, presence: true

  def self.top_ten_movies
    movies = Work.where(category: "movie")

    @top_ten_movies = movies.first(10)
    return @top_ten_movies
  end

  def self.top_ten_books
    books = Work.where(category: "book")

    @top_ten_books = books.first(10)
    return @top_ten_books
  end

  def self.top_ten_albums
    albums = Work.where(category: "album")

    @top_ten_albums = albums.first(10)
    return @top_ten_albums
  end

  def self.most_popular
    @most_popular = Work.first
    Work.all.each do |w|
      if w.votes.count > @most_popular.votes.count
        @most_popular = w
      end
    end
    return @most_popular
  end

end
