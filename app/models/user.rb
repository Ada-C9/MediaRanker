class User < ApplicationRecord
  has_many :votes

  validates :name, presence: true
  validates :name, length: { in: 1..50 }

  def report_works_voted_for

  end

end
