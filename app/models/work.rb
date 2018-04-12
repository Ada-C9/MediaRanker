class Work < ApplicationRecord
  has_many :votes
  has_many :upvoted_users, through: :votes, source: :user

  validates :category, presence: true
  validates :title, presence: true, uniqueness: { scope: :category }
  validates :creator, presence: true
  validates :publication_year, presence: true

  def find_top_ten(category)
    top_ten = []
    works = self.where(category: category)
    ordered_votes = works.order(category.votes.count)
    return ordered_votes
  end

end
