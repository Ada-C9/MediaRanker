class User < ApplicationRecord

  has_many :votes
  validates :name, presence: true, length: { minimum: 6 }


end
