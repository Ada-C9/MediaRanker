class Work < ApplicationRecord
  has_many :votes

  validates :category, presence: {message: "Must provide a category"}

  validates :title, presence: {message: "Please provide a title"}
  validates :title, uniqueness: {scope: :category, message: "Work already exists, in this category" }


  def self.valid_category
    %w[album book movie]
  end


end
