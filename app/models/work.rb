class Work < ApplicationRecord

  has_many :votes

  validates :title, presence: {message: "Enter a title"}
  validates :title, uniqueness: {message:"Please choose a different title. Titles cannot be duplicated"}
  validates :description, length: {maximum: 500, message: "Description is too long"}


  def self.media_spotlight
    works = Work.all
    works.max_by do |work|
      work.votes.count
      works.max_by { |work| work.votes.count}
    end
    return
  end

  def self.top_ten_albums
    album = Work.where(category: "album")
    return album.sort_by {|work| work.votes.count }.take(10)
  end

  def self.top_ten_movies
    movie = Work.where(category: "movie")
    return movie.sort_by {|work| work.votes.count }.take(10)
  end

  def self.top_ten_books
    book = Work.where(category: "book")
    return book.sort_by {|work| work.votes.count }.take(10)
  end

  def self.top
    sorted = Work.all.sort_by{|work| work.votes.count}
    top= sorted.first
    return top
  end

  def total_votes
    total = self.votes.count
    return total
  end

end
