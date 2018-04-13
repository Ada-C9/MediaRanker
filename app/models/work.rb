class Work < ApplicationRecord
  has_many :votes
  validates :category, presence: true
  validates :title, uniqueness: { scope: :category, message: "That title already exists in this category." }

  def vote_count
    self.votes.count
  end

  def self.valid_categories
    %w[album movie book]
  end

  def top_media

  end


end
