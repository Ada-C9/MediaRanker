class User < ApplicationRecord
  has_many :votes
  has_many :voted_works, through: :votes, source: :work
end
