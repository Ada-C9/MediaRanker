class Upvote < ApplicationRecord
  belongs_to :work
  belongs_to :user
  validates :user_id, :uniqueness => { scope: [:work_id]  }

  def get_creation_date
    return self.created_at.strftime("%B %d, %Y")
  end

end
