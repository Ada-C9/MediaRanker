class Work < ApplicationRecord
  has_many :votes

  validates :category, :title, :creator, presence: true

  def self.all_works (type)
    @all_works = Work.where(category: type)
  end

  def self.top_works (type)
    # how should I handle items with nil votes?
    # rewrite order to treat nil as 0 ?
    Work.order(:votes).limit(10)
  end

end
