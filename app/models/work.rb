class Work < ApplicationRecord
  has_many :votes

  validates :title, :created_by, :publication_date, :category, :presence => true

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

  def total_work_vote
    # given work, find total votes
    # votes = Vote.where(work_id: @work.work_id)
    # return votes.length

    total = self.votes.count
    return total
  end

  def total_user_votes
    # return total votes given a user
    # find user
    # call all votes on that user id
  end
end
