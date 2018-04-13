class Work < ApplicationRecord
  has_many :votes, dependent: :destroy
  has_many :users, through: :votes

  validates :category, presence: :true
  validates :title, presence: :true, uniqueness: { scope: :category }

  # scope :albums, where(category: :album)
  # scope :books, where(category: "books")
  # scope :movies, where(category: "movies")

  def self.ordered_works
    self.joins(:votes).group(:id).order('COUNT(votes.id) DESC')
  end

  def self.top_work
    self.ordered_works.first
  end

  def self.albums
    self.where(category: :album)
  end

  def self.books
    self.where(category: :book)
  end

  def self.movies
    self.where(category: :movie)
  end

  def self.top_ten
    self.limit(10)
  end
end
