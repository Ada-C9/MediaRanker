class Work < ApplicationRecord
  has_many :votes

  validates :title, presence: true

  def self.top_movies
    movies = Work.where(category: "movie")
    top_movies = (movies.limit(10).sort_by { |work| work.votes.count }).reverse!
    return top_movies
  end

end
