class Work < ApplicationRecord
  has_many :votes

  validates :title, presence: true
  validates :category, inclusion: %w(movie book album)
  validates :creator, presence: true

  def self.albums
    work = Work.where(category: 'album')
    work.sort_by do |w|
      w.votes.count
    end
  end

  def self.books
    work = Work.where(category: 'book')
    work.sort_by do |w|
      w.votes.count
    end
  end

  def self.movies
    work = Work.where(category: 'movie')
    work.sort_by do |w|
      w.votes.count
    end
  end

  def self.top_ten_album
    sorted = Work.albums
    sorted[-5...sorted.size].reverse
  end

  def self.top_ten_book
    sorted = Work.books
    sorted[-5...sorted.size].reverse
  end

  def self.top_ten_movie
    sorted = Work.movies
    sorted[-5...sorted.size].reverse
  end

end
