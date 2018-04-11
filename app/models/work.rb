class Work < ApplicationRecord
  has_many :votes

  validates :title, presence: true
  validates :title, length: { in: 1..75 }

  def of_category(media_cat)
    @cat_works = Work.where(category: media_cat)
  end

end
