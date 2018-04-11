class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :work

  validates :user_id, presence: true
  validates :work_id, presence: true

  def report_vote_tally_for_work(id_for_work)
    @m_vote_num = Vote.where(work_id: id_for_work).count
  end

  def report_works_voted_for(id_for_user)
    @upvoted_works = Vote.where(user_id: id_for_user)
  end
end
