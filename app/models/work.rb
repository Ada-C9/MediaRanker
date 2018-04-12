class Work < ApplicationRecord
  has_many :votes
  has_many :users, through: :votes
  belongs_to :category

  validates :title, presence: true

  def self.top_work
    return self.all.max_by { |work| work.votes.length }
  end

  def self.order_by_vote(category_id)
    category = Work.where(category_id: category_id)
    return category.sort_by {|work| work.votes.count}.reverse
  end

  # def self.order_by_vote(category_id)
  #   work_category = Work.where(category_id: category_id)
  #   ordered = work_category.joins(:votes).order('votes.count').group(:work_id)
  #
  #   return ordered
  # end
end
