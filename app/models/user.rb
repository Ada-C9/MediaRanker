class User < ApplicationRecord
  has_many :votes


  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: { in: 1..40 }

end
