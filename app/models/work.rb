class Work < ApplicationRecord
  has_many :users, through :votes

  validates :category, :title, :creator, :publication_year, :description, :presence: true

  validates :title, :creator  length: { in: 2..25 }
end
