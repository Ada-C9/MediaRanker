class Work < ApplicationRecord
  has_many :votes
  has_many :works, :through => :votes

  validates :title, presence: true
end
