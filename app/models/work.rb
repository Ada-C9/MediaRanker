class Work < ApplicationRecord
  has_many :votes
  has_many :upvoted_users, through: :votes, source: :user

  validates :category, presence: true
  validates :title, presence: true, uniqueness: { scope: :category }
  validates :creator, presence: true
  validates :publication_year, presence: true

  def self.order_albums
    albums = Work.where(category: 'album')
    return albums.sort_by{|album| album.votes.count}.reverse
  end

  def self.order_books
    books = Work.where(category: 'book')
    return books.sort_by{|book| book.votes.count}.reverse
  end

  def self.order_movies
    movies = Work.where(category: 'movie')
    return movies.sort_by{|movie| movie.votes.count}.reverse
  end

  def self.find_spotlight
    works = Work.all
    return works.sort_by{|work| work.votes.count}.reverse[0]
  end

end
