class Work < ApplicationRecord
  has_many :votes

  validates :category, presence: true
  validates :title, presence: true, uniqueness: { scope: :category }
  validates :creator, presence: true
  validates :publication_year, presence: true

  # def find_spotlight
  # end



end
