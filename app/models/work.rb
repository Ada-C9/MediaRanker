class Work < ApplicationRecord
  has_many :votes

  validates :category, :title, presence: true
  validates :title , uniqueness: true


  def self.top_votes
    all_work = Work.all.sort_by{ |work| work.votes.count}.reverse
  end
end
