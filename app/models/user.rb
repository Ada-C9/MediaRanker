class User < ApplicationRecord
  has_many :votes
  # has_many :works, through: :votes

  validates :name, presence: true


  def joined
    return self.created_at.strftime("%B %d, %Y")
  end

end
