class User < ApplicationRecord
  has_many :votes

  validates :name, length: { minimum: 1, maximum: 25 }, allow_blank: false
end
