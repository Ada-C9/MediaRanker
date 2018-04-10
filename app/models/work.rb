class Work < ApplicationRecord
  # def display_albums
  #   return Book.where(category:'album')
  # end
  has_many :votes
  has_many :users, through: :votes
end
