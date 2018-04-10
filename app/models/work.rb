class Work < ApplicationRecord

  validates :title, :creator, presence: true

  validates :category, inclusion: { in: %w(album book movie),
  message: "%{value} is not a valid category" }
end
