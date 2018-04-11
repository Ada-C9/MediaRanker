require 'pry'

class Publication < ApplicationRecord
  has_many :votes

  validates :category, presence: true
  validates :title, presence: true, length: { minimum: 1 }
  validates :category, uniqueness: {scope: [:title]}

  def find_total_votes
    self.votes.length
  end
  def self.find_spotlight_publication
    publications_with_votes = Publication.all.find_all{ |publication| !publication.votes.empty? }
    return nil if publications_with_votes.empty?
    sorted_publications = publications_with_votes.sort_by do |publication|
      publication.most_recent_vote.created_at
    end
    sorted_publications.reverse!
    spotlight = sorted_publications.max_by {| publication | publication.find_total_votes}

    spotlight
  end
  def self.return_all_categories
    categories = []
    Publication.all.each do |publication|
      next if categories.include?(publication.category)
      categories << publication.category
    end
    categories
  end
  def self.find_top_ten_by category
    Publication.first(10)
  end

# helper method for finding spotlight publication
  def most_recent_vote
    self.votes.max_by { |vote| vote.created_at }
  end
end
