class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :work

  validates :user_id, presence: true
  validates :work_id, presence: true


  def report_works_voted_for(id_for_user)
    @upvoted_works = self.where(user_id: id_for_user)
  end

end
