class Twitter < ApplicationRecord
  validates :handle, presence: true
  validates :followers, presence: true

  has_many :votes
  has_many :users, through: :votes
end
