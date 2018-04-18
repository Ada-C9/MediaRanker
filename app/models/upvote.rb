class Upvote < ApplicationRecord
  belongs_to :work, counter_cache: :vote_count
  belongs_to :user
  validates :user_id, :uniqueness => { scope: [:work_id], message: "cannot vote for same work twice"  }

  def get_creation_date
    return self.created_at.strftime("%B %d, %Y")
  end

end
