class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :work

  validates :user_id, presence: true
  validates :work_id, presence: true
  validate :one_vote_per_user_per_work

  def one_vote_per_user_per_work
    if self.where("user_id = ? AND work_id = ?", params[:user_id], params[:work_id]).count > 0
      errors.add(:kind, "You can't upvote the same work twice.")
    end
  end


  def report_works_voted_for(id_for_user)
    @upvoted_works = self.where(user_id: id_for_user)
  end

end
