class User < ApplicationRecord
  has_many :votes, :dependent => :destroy

  validates :name, presence: true, uniqueness: true


  def joined
    return self.created_at.strftime("%m-%d-%Y")
  end
end
