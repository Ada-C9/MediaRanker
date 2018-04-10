class Publication < ApplicationRecord
  has_many :votes

  validates :publication_year, length: { is: 4 }
  validates :publication_year, presence: true
  validates :publication_year, numericality: { only_integer: true, less_than_or_equal_to: 2018 }
end
