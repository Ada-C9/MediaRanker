class Work < ApplicationRecord
  has_many :votes, :dependent => :destroy

  validates :title, presence: true, uniqueness: true
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

  def self.top_five_album
    sorted = Work.albums
    sorted[-5...sorted.size].reverse
  end

  def self.top_five_book
    sorted = Work.books
    sorted[-5...sorted.size].reverse
  end

  def self.top_five_movie
    sorted = Work.movies
    sorted[-5...sorted.size].reverse
  end

  def self.top_work
    self.all.sort_by { |work| work.votes.count }.reverse.first
  end


end
