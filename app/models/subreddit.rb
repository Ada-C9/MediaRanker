class Subreddit < ApplicationRecord
  validates :title, presence: true

  has_many :votes, dependent: :destroy


  def self.mostVoted
    sorted = Subreddit.all.sort_by do |subreddit|
      (subreddit.votes.count)
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
