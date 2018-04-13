class Publication < ApplicationRecord
  has_many :votes

  validates :category, presence: true
  validates :title, presence: true, length: { minimum: 1 }
  validates :category, uniqueness: {scope: [:title]}

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
    # original approach to categories
    # categories = []
    # Publication.all.each do |publication|
    #   next if categories.include?(publication.category)
    #   categories << publication.category
    # end
    # categories

    CATEGORIES
  end
  def self.find_top_ten_by category
    if !Publication.return_all_categories.include?(category)
      raise StandardError.new("Category does not exist")
    end
    publications_of_category = Publication.where(category: category).order(created_at: :asc)
    sorted_by_recent_vote = publications_of_category.sort_by do |publication|
      if publication.most_recent_vote.nil?
        0
      else
        publication.most_recent_vote.created_at.to_i
      end
    end
    sorted_by_vote_length = sorted_by_recent_vote.sort_by { |publication| publication.votes.length }
    sorted_by_vote_length.reverse!
    if sorted_by_vote_length.length <= 10
      return sorted_by_vote_length
    else
      return sorted_by_vote_length.first(10)
    end
  end

# helper method for finding spotlight publication
  def most_recent_vote
    self.votes.max_by { |vote| vote.created_at }
  end
end
