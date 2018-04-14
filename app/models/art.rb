class Art < ApplicationRecord
  has_many :votes
  validates :category, :title, presence: true
  validates :category, inclusion: { in: %w(movie album book), message: "%{value} is not a valid category" }
end
