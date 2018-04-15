class User < ApplicationRecord

  has_many :votes, dependent: :destroy

  validates :name, presence: { message: "can't be blank"}
  validates :name, uniqueness: {message:"has already been taken"}
end
