class Work < ApplicationRecord
  has_many :votes

  validates :title, presence: true
  validates :category, presence: true
  validates :title, uniqueness: {scope: :category}
end
