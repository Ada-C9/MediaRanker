class User < ApplicationRecord
  has_many :votes
  has_many :upvoted_works, through: :votes, soure: :work

  validates :name, presence: true, uniqueness: true

end
