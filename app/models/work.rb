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
    # votes = Vote.where(work_id: @work.work_id)
    # return votes.length
    total = self.votes.count
    return total
  end

  def self.spotlight_work
    works = Work.all

    ordered_work = works.sort {
      |work1, work2| work2.total_work_vote <=> work1.total_work_vote
    }
    raise 
    return ordered_work.first

  end

end
