class User < ApplicationRecord
  has_many :votes
  has_many :works, through: :votes

  validates :username, presence: { message: "Username can't be blank" }, uniqueness: { message: "That username is already in use"}
end
