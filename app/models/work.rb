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

  def self.top_ten_albums
    self.where(category: :album).limit(10)
  end

  def self.top_ten_books
    self.where(category: :book).limit(10)
  end

  def self.top_ten_movies
    self.where(category: :movie).limit(10)
  end
end
