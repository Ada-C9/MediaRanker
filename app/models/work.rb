class Work < ApplicationRecord

  has_many :votes

  validates :title, presence: true
  validates :category, presence: true

  validates :category, inclusion: { in: %w(movie book album) }

  def self.albums
    Work.where(category: "album")
  end

  def self.movies
    Work.where(category: "movie")
  end

  def self.books
    Work.where(category: "book")
  end

  #TODO write top 10 logic below here
  
end
