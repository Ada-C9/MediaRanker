class User < ApplicationRecord
  has_many :votes
  has_many :works, through: :votes

  validates :username, presence: { message: "You must provide a username" }, uniqueness: { message: "That username is already in use"}
end
