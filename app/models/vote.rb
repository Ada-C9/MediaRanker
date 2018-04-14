class Vote < ApplicationRecord
  belongs_to :work
  belongs_to :user

  validates :user_id, :work_id, presence: true

  def expiration_date_cannot_be_in_the_past
    if expiration_date.present? && expiration_date < Date.today
      errors.add(:expiration_date, "can't be in the past")
    end
  end

  def self.votes_by_user (user)
    @user_votes = Vote.where(user_id: user.id)
    return @user_votes
  end

  def self.votes_by_work (work)
    @work_votes = Vote.where(work_id: work.id)
    return @work_votes
  end

  # def self.voted (vote)
  #   if vote.instance_of? Vote
  #     @work = Work.find(vote.work_id)
  #     @work.votes += 1
  #
  #     @user = User.find(vote.user_id)
  #     @user.votes += 1
  #   end
  # end
end
