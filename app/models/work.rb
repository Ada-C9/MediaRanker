class Work < ApplicationRecord
  has_many :votes

  validates :category, presence: true

  validates :creator, presence: true
  validates :title, length: { in: 1..25 }

  validates :title, presence: true
  validates :title, length: { in: 1..50 }
end
