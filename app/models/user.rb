class User < ApplicationRecord
  has_many :votes

  validates :username, presence: true
  validates :username, length: { in: 1..25 }

end
