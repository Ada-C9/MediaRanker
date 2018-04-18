class Work < ApplicationRecord
  has_many :upvotes

  validates :title, presence: true, uniqueness: true, length: { minimum: 1}

  validates :creator, presence: true

  validates :publication_year, presence: true, numericality: {only_integer: true, greater_than: 0, less_than_or_equal_to: Date.current.year}

  KINDS = ["Album", "Book", "Movie"]

  def get_count
    return upvotes.count
  end

  def self.get_works(type)
    works = Work.where(category: type)
    return works
  end

  def self.get_sorted_works(type)
    works = get_works(type)
    sorted = works.sort_by {|item| item.get_count}.reverse
    return sorted
  end

  def self.top_ten(type)
    return get_sorted_works(type).limit(10)
  end

  def self.categorized
    organized = KINDS.map {|medium| get_sorted_works(medium)}
    return organized
  end
end
