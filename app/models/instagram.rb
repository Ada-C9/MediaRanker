class Instagram < ApplicationRecord
  validates :handle, presence: true
  validates :followers, presence: true

  has_many :votes, dependent: :destroy


  def self.mostVoted
    sorted = Instagram.all.sort_by do |instagram|
      (instagram.votes.count)
    end
    return sorted.reverse
  end

def spotlight
  self.first(1)
end

  def self.first_10(array)
    array.first(10)
  end
end
