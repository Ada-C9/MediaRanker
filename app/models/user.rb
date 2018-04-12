class User < ApplicationRecord
  has_many :votes, through: :works

  validates :name, presence: true, uniqueness: true

end
