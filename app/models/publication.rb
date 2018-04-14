class Publication < ApplicationRecord
  has_many :votes
  validates :title, presence: true, length: {minimum: 1, maximum: 30}

  validates :creator, presence: true, length:  {minimum: 1, maximum: 25}

  validates :publication_year, presence: true, length: { is: 4 }
  validates :publication_year, numericality: { only_integer: true, less_than_or_equal_to: 2018 }

  def self.find_votes(category)
    collection = Publication.where(category: category)
    return collection.left_joins(:votes).group(:id).order('COUNT(votes.id) DESC')
  end

  def self.highest(num, category)
    sort = Publication.where(category: category)
    return sort.left_joins(:votes).group(:id).order('COUNT(votes.id) DESC').limit(num)
  end

  def self.spotlight
    all = Publication.all
    list = all.left_joins(:votes).group(:id).order('COUNT(votes.id) DESC').limit(1)
    return list.first
  end
end
