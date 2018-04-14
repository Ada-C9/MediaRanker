class User < ApplicationRecord
  has_many :votes
  has_many :upvoted_works, through: :votes, source: :work

  validates :name, presence: true, uniqueness: true

end
