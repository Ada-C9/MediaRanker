class Vote < ApplicationRecord
  belongs_to :work
  belongs_to :user

  validates :user_id, :work_id, presence: true

  def self.votes_by_user (user)
    @user_votes = Vote.where(user_id: user.id)
    return @user_votes
  end

  def self.votes_by_work
    @work_votes = Vote.where(user_id: user.id)
    return @work_votes
  end
end
