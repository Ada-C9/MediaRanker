class Publication < ApplicationRecord
  has_many :votes

  validates :category, presence: true
  validates :title, presence: true, length: { minimum: 1 }
  validates :title, uniqueness: {scope: [:category]}

  CATEGORIES = ["movie", "book", "album"]

  def find_total_votes
    self.votes.empty? ? 0 : self.votes.length
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
    CATEGORIES
  end

# helper method for finding spotlight publication
  def most_recent_vote
    self.votes.max_by { |vote| vote.created_at }
  end
end
