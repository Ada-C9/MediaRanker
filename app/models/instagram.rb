class Instagram < ApplicationRecord
  validates :handle, presence: true
  validates :followers, presence: true

has_many :votes
has_many :users, through: :votes


  def first_10
     self.first(10)
  end
end
