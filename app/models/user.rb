class User < ApplicationRecord
  has_many :votes

  validates :username, presence: true

  def format_join_date
    return self.created_at.strftime("%b %d, %Y")
  end
end
