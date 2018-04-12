class Work < ApplicationRecord
  has_many :votes
  has_many :upvoted_users, through: :votes, source: :user

  validates :category, presence: true
  validates :title, presence: true, uniqueness: { scope: :category }
  validates :creator, presence: true
  validates :publication_year, presence: true

  def find_top_ten(category)
    top_ten = []
    works_hash = {}
    works = self.where(category: category)

    works.each do |work|
      works_hash[work] = work.votes.count
    end

    ordered_votes = works_hash.sort_by{|k, v| v}.reverse

    top_ten = ordered_votes.sort_by{|k, v| -v}[0..9]
    return top_ten
  end

end
