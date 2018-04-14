class Work < ApplicationRecord

  has_many :votes, dependent: :destroy

  validates :title, presence: {message: "can't be blank"}
  validates :title, uniqueness: {message:"has already been taken"}
  validates :description, length: {maximum: 500, message: "Description is too long"}



  def self.top_ten_albums
    album = Work.where(category: "album")
    return album.sort_by {|work| work.votes.count }.reverse.take(10)
  end

  def self.top_ten_movies
    movie = Work.where(category: "movie")
    return movie.sort_by {|work| work.votes.count }.reverse.take(10)
  end

  def self.top_ten_books
    book = Work.where(category: "book")
    return book.sort_by {|work| work.votes.count }.reverse.take(10)
  end

  def self.media_spotlight
    sorted = Work.all.sort_by{|work| work.votes.count}.reverse
    top= sorted.first
    return top
  end

  def total_votes
    total = self.votes.count
    return total
  end

end
