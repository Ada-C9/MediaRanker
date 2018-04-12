class Work < ApplicationRecord
  has_many :votes
  has_many :upvoted_users, through: :votes, source: :user

  validates :category, presence: true
  validates :title, presence: true, uniqueness: { scope: :category }
  validates :creator, presence: true
  validates :publication_year, presence: true




end
