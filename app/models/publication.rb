class Publication < ApplicationRecord
  has_many :votes
  
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
