class Work < ApplicationRecord
  has_many :votes

  validates_presence_of :title, :category

  validates :title, uniqueness: { scope: :category, message: "Cannot have the same title within the same media type" }

end
