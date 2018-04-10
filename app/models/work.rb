class Work < ApplicationRecord
  has_many :upvotes

  validates :title, presence: true, uniqueness: true
  validates :creator, presence: true
  validates :publication_year, presence: true, numericality: {only_integer: true, greater_than: 0}
end
