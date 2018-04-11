class User < ApplicationRecord
  has_many :votes

  validates :name, presence: true, length: {minimum: 1, maximum: 25}
  validates :name, format: { with: /\A[a-zA-Z0-9]+\Z/ }

end
