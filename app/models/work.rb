class Work < ApplicationRecord
  has_many :votes

  validates :title, presence: true, uniqueness: true
  validates :creator, presence: true
  validates :publication_year, presence: true
end
