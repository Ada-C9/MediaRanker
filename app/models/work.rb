class Work < ApplicationRecord
  has_many :votes

  validates :category, pressence: {message: "Must provide a category"}

  validates :title, pressence: {message: "Please provide a title"}
  validates :title, uniqueness: {message: "Work already exists" }
end
