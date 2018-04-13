class Twitter < ApplicationRecord
  validates :handle, presence: true
  validates :followers, presence: true

  has_many :votes

end
