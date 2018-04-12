class Work < ApplicationRecord
  has_many :votes
  validates :title, presence: true

  # add requirement for uniqueness of title by category?

  def vote_count
    self.votes.count
  end

  def self.valid_categories
    %w[album movie book]
  end

end
