class Work < ApplicationRecord
  has_many :votes

  validates :category, presence: true
  validates :title, presence: true
  validates :title, length: { in: 1..25 }
  validates :publication_year, numericality: true
  validates :publication_year, length: { is: 4 }

  def top_ten_books
    Work.includes(:book).order('vote.count asc')
  end
end
