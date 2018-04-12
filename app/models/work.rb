class Work < ApplicationRecord
  has_many :votes, dependent: :destroy
  validates :title, presence: true
  validates :category, presence: true
  validates :category, inclusion: { in: %w(movie book album)}

  def total_votes
  end





end
