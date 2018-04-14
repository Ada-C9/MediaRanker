

class Vote < ApplicationRecord

  belongs_to :user
  belongs_to :work

  validates :user_id, presence: true
  validates :work_id, presence: true

  validate :one_vote_per_user_per_work

  def one_vote_per_user_per_work
    matching = self.report_user_votes(self.user_id).find_by(work_id: self.work_id)
    unless matching.nil?
      raise
      self.errors.add(:work_id, "You can only upvote a work once.")
    end
  end

  def self.report_works_voted_for(id_for_user)
    @upvoted_works = self.where(user_id: id_for_user)
  end

end
