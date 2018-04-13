class Work < ApplicationRecord
  has_many :votes, dependent: :destroy

  validates :category, presence: true

  validates :title, presence: true
  validates :title, uniqueness: true

  validates :title, length: { in: 1..35 }


  def self.works_with_vote_tallies
    works = self.all
    all_tallies = {}
    works.each do |work|
      work_tally_hash = {work => work.report_vote_tally(work.id)}
      all_tallies.merge!(work_tally_hash)
    end
    sorted_tallies = all_tallies.sort_by {|k, v| v }.reverse.to_a
    return sorted_tallies
  end

  def self.get_top_ten_works_with_tallies
    top_ten = works_with_vote_tallies.first(10)
    return top_ten
  end

  def self.get_top_work_with_tally
    top = works_with_vote_tallies.first(1)
    top.flatten!
    return top
  end

end
