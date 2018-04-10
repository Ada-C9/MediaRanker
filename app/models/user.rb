class User < ApplicationRecord

  validates :username, presence: true, uniqueness: true

  def join_date
    self.created_at.strftime("%B %-d, %Y")
  end
end
