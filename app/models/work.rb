class Work < ApplicationRecord
  has_many :upvotes, dependent: :destroy

  validates :title, presence: true, uniqueness: { scope: [:category]}
  validates :category, presence: true
  validates :publication_year, presence: true, numericality: { only_integer: true,  }, length: {is: 4 }
  validates :creator, presence: true
  validates :description, length: { maximum: 500 }
  validate :publication_year_must_be_in_the_past

  def upvotes_count
    return upvotes.count
  end

  private
  def publication_year_must_be_in_the_past
    if !publication_year.nil? && publication_year > Date.today.year
      errors.add(:publication_year, "cannot be in the future")
    end
  end

  def self.top(count, category=nil)
    if category
      works = self.where(category: category)
    else
      works = self.all
    end
    sorted_works = works.sort_by { |work| work.upvotes.count }.reverse!
    actual_count = [count, sorted_works.count].min
    top_works = sorted_works[0...actual_count]
    return top_works
  end

end
