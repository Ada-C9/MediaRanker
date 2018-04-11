class Work < ApplicationRecord
  # def display_albums
  #   return Book.where(category:'album')
  # end
  has_many :votes
  has_many :users, through: :votes

  validates :title, presence: true,  uniqueness: true
  validates :creator, presence: true
  validates :publication_year, presence: true
  validates :description, presence: true
end
