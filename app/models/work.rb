class Work < ApplicationRecord
  has_many :votes

  validates :category, presence: true
  validates :title, length: { minimum: 1, maximum: 25 }, allow_blank: false
end
