class Work < ApplicationRecord
  has_many :votes

  validates :category, presence: {message: "Must provide a category"}

  validates :title, presence: {message: "Please provide a title"}
  validates :title, uniqueness: {message: "Work already exists" }

  def self.valid_category
    %w[album book movie]
  end


end
