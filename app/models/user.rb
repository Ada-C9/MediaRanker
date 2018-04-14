class User < ApplicationRecord
  has_many :votes

  validates :username, presence: true
  validates :username, length: { in: 2..25 }

  validates :username, uniqueness: true
end
