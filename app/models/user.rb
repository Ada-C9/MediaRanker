class User < ApplicationRecord
  has_many :votes

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :username, length: { in: 1..15 }

end
