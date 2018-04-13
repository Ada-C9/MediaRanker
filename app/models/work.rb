class Work < ApplicationRecord
  has_many :votes

  validates :category, presence: true
  validates :title, length: { minimum: 1, maximum: 25 }, allow_blank: false

  def self.top_work(works)
    highest = works.first
    works.each do |work|
      if work.votes.count > highest.votes.count
        highest = work
      end
    end
    return highest
  end

end
