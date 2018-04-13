class Publication < ApplicationRecord
  has_many :votes
  validates :title, presence: true, length: {minimum: 1, maximum: 30}

  validates :creator, presence: true, length:  {minimum: 1, maximum: 25}

  validates :publication_year, presence: true, length: { is: 4 }
  validates :publication_year, numericality: { only_integer: true, less_than_or_equal_to: 2018 }

  def self.find_votes
    self.left_joins(:votes).group(:id).order('COUNT(votes.id) DESC')
  end
end
