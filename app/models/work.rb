class Work < ApplicationRecord
  has_many :votes

  validates :category, presence: true
  validates :title, length: { minimum: 1, maximum: 25 }, allow_blank: false

  include Comparable

  def <=> (other_work)
    votes.count <=> other_work.votes.count
  end

  def self.category_list(works, category)
    list = []
    works.each do |work|
      if work.category == category
        list << work
      end
    end
    list = list.sort.reverse
    return list[0..9]
  end
end
