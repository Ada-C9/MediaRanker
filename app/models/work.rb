class Work < ApplicationRecord
  has_many :votes
  # has_many :users, through: :votes

  validates :title, :category, presence: true


  def self.books
    array = Work.where(category: "book")
    new_array = array.sort_by { |item| item.votes.count }.reverse
    return new_array
  end

  def self.albums
    array = Work.where(category: "album")
    new_array = array.sort_by { |item| item.votes.count }.reverse
    return new_array
  end

  def self.movies
    array = Work.where(category: "movie")
    new_array = array.sort_by { |item| item.votes.count }.reverse
    return new_array
  end


end
