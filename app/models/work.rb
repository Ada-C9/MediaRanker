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

  def self.category_list(works, category)
    list = []
    works.each do |work|
      if work.category == category && list.length < 10
        list << work
      end
    end
    return list
  end

end
