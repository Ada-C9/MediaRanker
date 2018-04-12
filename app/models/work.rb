class Work < ApplicationRecord
  has_many :votes
  has_many :users, through: :votes

  validates :title, :creator, :category, presence: true
  validates :published, format: { with: /\d{4}/ }, numericality: { less_than_or_equal_to: Time.now.strftime("%Y").to_i }

  def self.make_category_hash
    categories = []
    i = 0
    while i < Work.all.length
      if categories.include?(Work.all[i].category) == false
        categories << Work.all[i].category
      end
      i += 1
    end
    return categories
  end

  def self.spotlight
    work_spotlight = Work.first
    max = Work.first.votes.count
    Work.all.each do |work|
      if work.votes.count > max
        max = work.votes.count
        work_spotlight = work
      end
    end
    return work_spotlight
  end

  def self.sort_by_vote
    all_works = Work.all
    sorted_works = all_works.sort_by { |work| -work.votes.count }
    return sorted_works
  end

  def self.num_runs(array)
    runs = 0
    array.length > 10 ? runs = 10 : runs = array.length
    return runs
  end

end
