class User < ApplicationRecord
  has_many :votes

  validates :user_name, presence: { message: "Please provide a user name." }
  validates :user_name, uniqueness: true
end
