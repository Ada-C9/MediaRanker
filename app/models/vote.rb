class Vote < ApplicationRecord
  belongs_to :work
  belongs_to :user

  validates :work_id, uniqueness: { scope: [:user_id] }

  def format_vote_date
    return self.created_at.strftime("%b %d, %Y")
  end

end
