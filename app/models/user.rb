class User < ApplicationRecord
  has_many :votes
  validates :name, presence: true

  def joined
    self.created_at.strftime("%B %D, %Y")
  end
end
