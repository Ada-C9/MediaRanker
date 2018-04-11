class User < ApplicationRecord
  has_many :votes

  validates :username, presence: true
  validates :username, length: { in: 2..25 }

  validate :username, uniqueness: true,
end
