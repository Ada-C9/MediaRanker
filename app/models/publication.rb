class Publication < ApplicationRecord
  has_many :votes

  validates :category, presence: true
  validates :title, presence: true, length: { minimum: 1 }
  validates :category, uniqueness: {scope: [:creator, :title]}

  def self.find_spotlight_publication
    Publication.first
  end
  def self.return_all_categories
    media = ['album', 'book']
  end
  def self.find_top_ten_by category
    Publication.first(10)
  end
  def find_total_votes
  end
end
