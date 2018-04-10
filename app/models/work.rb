class Work < ApplicationRecord
  has_many :votes

  validates :category, presence: true, uniqueness: { scope: :title}
  validates :title, presence: true, uniqueness: { scope: :category }
  validates :creator, presence: true
  validates :publication_year, presence: true

end
