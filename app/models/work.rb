class Work < ApplicationRecord
  has_many :votes

  validates :title, presence: true
  validates :title, length: { in: 1..75 }

end
