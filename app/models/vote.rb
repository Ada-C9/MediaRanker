class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :work

  def vote_date
    self.created_at.strftime("%B %-d, %Y")
  end
end
