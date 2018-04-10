class Work < ApplicationRecord
  has_many :votes

# validates_presence_of :title, :category

  validates :category, presence:  {message: "Must provide a category"}

  validates :title, presence: {message: "Please provide a title"}
  validates :title, uniqueness: {message: "Work already exists" }
end
