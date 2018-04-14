class Work < ApplicationRecord
  has_many :votes
  has_many :users, through: :votes

  validates :title, presence: true,  uniqueness: true

  def self.highest_rated_work
    works = self.all
    return works.max_by{|a_work| a_work.votes.count}
  end

  def self.top_ten
    works = self.all
    works.sort_by{|work|work.votes.count}.reverse.first(10)
  end
end
