class Work < ApplicationRecord
  has_many :votes
  validates_presence_of :title, :category

  def vote_count
    self.votes.where(work_id: self.id).count
  end

end
