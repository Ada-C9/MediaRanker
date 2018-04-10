class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :work

  validate :one_user_one_vote

  def one_user_one_vote
    works_voted_by_user = Vote.where(user_id: user_id, work_id: work_id)

    errors.add(:user, "Has already voted for this work") if !works_voted_by_user.empty?
  end
end
