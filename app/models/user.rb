class User < ApplicationRecord
  has_many :votes

  validates :name, presence: true
  validates :name, length: { in: 1..50 }

end
