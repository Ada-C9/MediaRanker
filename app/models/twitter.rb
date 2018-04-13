class Twitter < ApplicationRecord
  validates :handle, presence: true
  validates :followers, presence: true

  has_many :votes, dependent: :destroy

  def self.mostVoted
    sorted = Twitter.all.sort_by do |twitter|
      (twitter.votes.count)
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
