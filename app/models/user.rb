class User < ApplicationRecord
  validates :name, presence: true

  has_many :votes
  has_many :instagrams, through: :votes
end
