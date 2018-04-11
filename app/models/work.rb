class Work < ApplicationRecord
  has_many :upvotes

  validates :title, presence: true, uniqueness: { scope: [:category]}
  validates :category, presence: true
  validates :publication_year, presence: true, numericality: { only_integer: true,  }, length: {is: 4 }
  validates :creator, presence: true
  validates :description, length: { maximum: 500 }
  validate :publication_year_must_be_in_the_past

  private
  def publication_year_must_be_in_the_past
    if !publication_year.nil?
      if publication_year > Date.today.year
        errors.add(:publication_year, "cannot be in the future")
      end
    end
  end
end
