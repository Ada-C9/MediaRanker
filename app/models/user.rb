class User < ApplicationRecord
  has_many :upvotes

  validates :name, presence: true, uniqueness: true, length: { minimum: 2}
end
