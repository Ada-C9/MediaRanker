class Work < ApplicationRecord
  has_many :votes

  validates :category, :title, :creator, presence: true

  def self.all_works (type)
    @all_works = Work.where(category: type)
  end

  def self.top_works (type)
    @all_works = Work.where(category: type).limit(10)
  end

end
