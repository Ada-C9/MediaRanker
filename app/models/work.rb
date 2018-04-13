class Work < ApplicationRecord
  has_many :votes

  validates :title, presence: true
  validates :category, inclusion: %w(movie book album)
  validates :creator, presence: true
end
