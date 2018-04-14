class Work < ApplicationRecord
  has_many :votes
  has_many :users, through: :votes
  belongs_to :category

  validates :title, presence: true

  def self.top_work
    return self.all.max_by { |work| work.votes.length }
  end

  # def self.order_by_vote(category_id)
  #   category = Work.where(category_id: category_id)
  #   return category.sort_by {|work| work.votes.count}.reverse
  # end

  def self.order_by_vote(category_id)
    work_category = Work.where(category_id: category_id)
    id = work_category.joins('left join votes on votes.work_id = works.id').select('works ').order('count(votes.id)').group('works.id')

    ordered = Work.where(id: id)

    return ordered
  end
end
