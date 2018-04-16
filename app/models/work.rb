class Work < ApplicationRecord
  has_many :votes

  validates :title, presence: true

  def self.movies
    movies = Work.where(category: "movie")
    movies = (movies.sort_by { |work|
      work.votes.count
    }).reverse
  end

  def self.books
    books = Work.where(category: "book")
    books = (books.sort_by { |work|
      work.votes.count
    }).reverse
  end

  def self.albums
    albums = Work.where(category: "album")
    albums = (albums.sort_by { |work|
      work.votes.count
    }).reverse
  end

  def self.top_movies
    movies = self.movies
    top_movies = movies[0..9]
    return top_movies
  end

  def self.top_books
    books = self.books
    top_books = books[0..9]
    return top_books
  end

  def self.top_albums
    albums = self.albums
    top_albums = albums[0..9]
    return top_albums
  end

  def self.top_work
    works = Work.all
    top_work = Work.new
    works.each do |work|
      if work.votes.count > top_work.votes.count
        top_work = work
      end
    end
    return top_work
  end

  def upvote_work(user)
    vote = Vote.new
    vote.work = self
    vote.user = user
    vote.save
    return vote
  end

end
