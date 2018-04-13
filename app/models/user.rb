class User < ApplicationRecord
  validates :name, presence: true

  has_many :votes

  # has_many :instagrams, through: :votes
  # has_many :twitters, through: :votes
  # has_many :subreddits, through: :votes





end
