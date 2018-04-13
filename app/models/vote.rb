class Vote < ApplicationRecord
  belongs_to :work
  belongs_to :user

  validates :user_id, :work_id, presence: true


  def self.votes_by_user (user)
    @user_votes = Vote.where(user_id: user.id)
    return @user_votes
  end

  # def user_vote_count (user)
  #   return Vote.votes_by_user(user).count
  # end


  def self.voted (vote)
    if vote.instance_of? Vote
      @work = Work.find(vote.work_id)
      @work.votes += 1

      @user = User.find(vote.user_id)
      @user.votes += 1
    end
  end

  # # this returns an array of votes for a work
  # def self.votes_by_work (work)
  #   @work_votes = Vote.where(work_id: work.id)
  #   return @work_votes
  # end
  #
  # def update_work_votes (work)
  #   # can I just say @work_votes.count ?
  #   Vote.votes_by_work(work).count
  # end
end
