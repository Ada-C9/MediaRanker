class Work < ApplicationRecord
  has_many :votes
  has_many :upvoted_users, through: :votes, source: :user

  validates :category, presence: true
  validates :title, presence: true, uniqueness: { scope: :category }
  validates :creator, presence: true
  validates :publication_year, presence: true

  def self.top_ten_albums
    albums = Work.where(category: 'album')
    return albums.sort_by{|album| album.votes.count}.reverse[0..9]

    # works.each do |work|
    #   works_hash[work] = work.votes.count
    # end
    #
    # ordered_votes = works_hash.sort_by{|k, v| v}.reverse
    #
    # top_ten = ordered_votes.sort_by{|k, v| -v}[0..9]
    # return top_ten
  end

end
