class User < ApplicationRecord
  has_many :votes
  validates :name, presence: true
  validates :votes, uniqueness: {scope: :work}
end
