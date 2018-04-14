class User < ApplicationRecord
  has_many :votes, dependent: :destroy
  has_many :voted_works, through: :votes, source: :work

  validates :name, presence: true, uniqueness: true

  def calculate_distance()
  end

  def self.vote_distance(user_list)
  end

end
