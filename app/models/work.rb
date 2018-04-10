class Work < ApplicationRecord
  has_many :votes
  has_many :users, through: :votes
  belongs_to :category

  validates :title, presence: true

  def self.top_work
    return self.all.max_by { |work| work.votes.length }
  end

  def self.top_10(category_id)
    category = Work.where(category_id: category_id)
    ordered = category.sort_by {|work| work.votes.count}.reverse
    return ordered.first(10)
  end
end
