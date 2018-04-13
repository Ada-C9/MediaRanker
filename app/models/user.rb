class User < ApplicationRecord
  has_many :votes, dependent: :destroy
  has_many :voted_works, through: :votes, source: :work

  validates :name, presence: true
end
