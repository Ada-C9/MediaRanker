class Work < ApplicationRecord
  has_many :votes, dependent: :destroy
  has_many :voted_users, through: :votes, source: :user

  validates :title, presence: true,
                  uniqueness: { scope: :creator}

  validates :category,  presence: true,
                      inclusion: { in: %w(album book movie) }

  def self.books
    Work.where(category: "book")
  end

  def self.movies
    Work.where(category: "movie")
  end

  def self.albums
    Work.where(category: "album")
  end

  def self.top_ten(category)
    Work.where(category: category).order(vote_count: :desc).limit(10)
  end

  def self.spotlight
    Work.order(vote_count: :desc).first
  end
end
