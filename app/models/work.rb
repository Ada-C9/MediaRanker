class Work < ApplicationRecord
  has_many :votes

  validates :title, presence: true
  validates :category, presence: true
  validates :title, uniqueness: {scope: :category}


  def self.top_ten(genre)
    genre_list = Work.where(category: genre)
    genre_list = genre_list.sort_by {|work| work.votes.count * -1}
    return genre_list.first(10)
  end

  def self.top
    top = Work.all.sort_by {|work| work.votes.count * -1}
    return top.first
  end

  def self.sort
    Work.all.sort_by {|work| work.votes.count * -1}
  end
end
