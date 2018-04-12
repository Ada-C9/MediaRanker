class Work < ApplicationRecord
  has_many :votes
  has_many :upvoted_users, through: :votes, source: :user

  validates :category, presence: true
  validates :title, presence: true, uniqueness: { scope: :category }
  validates :creator, presence: true
  validates :publication_year, presence: true

  def self.top_ten_albums
    albums = Work.where(category: 'album')
    return albums.sort_by{|album| album.votes.count}.reverse[0..9]
  end

  def self.top_ten_books
    books = Work.where(category: 'book')
    return books.sort_by{|book| book.votes.count}.reverse[0..9]
  end

  def self.top_ten_movies
    movies = Work.where(category: 'movie')
    return movies.sort_by{|movie| movie.votes.count}.reverse[0..9]
  end

end
