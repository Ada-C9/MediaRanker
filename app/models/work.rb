class Work < ApplicationRecord
  has_many :votes
  has_many :works, :through => :votes

  validates :title, presence: true

  def self.top_ten_movies
    @top_ten_movies = []
    @top_ten_movies = self.order(votes.count).first(10)
    return @top_ten_movies
  end

  def most_popular
    @works = Work.all
    @most_popular = Work.first
    # @works.each do |w|
    #   if w.votes.count > @most_popular.votes.count
    #     @most_popular = w
    #   end
    # end
    return @most_popular
  end

end
