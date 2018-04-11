class User < ApplicationRecord
  has_many :votes

  validates :name, presence: true

  def joined
    return self.created_at.strftime("%m %d %Y")
  end
end
