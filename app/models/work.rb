class Work < ApplicationRecord
  # def display_albums
  #   return Book.where(category:'album')
  # end
  has_many :votes
  has_many :users, through: :votes

  validates :title, presence: true,  uniqueness: true

  def self.highest_rated_work
    works = self.all
    return works.max_by{|a_work| a_work.votes.count}
  end

  def self.top_ten
    works = self.all
    top_works = {}

    works.each do |work|
      if top_works[work].nil?
        top_works[work] = 1
      else
        top_works[work]+=1
      end
    end

    return top_works.sort_by{|work_obj,votes|-votes}.first(10).map(&:first)
  end

end
