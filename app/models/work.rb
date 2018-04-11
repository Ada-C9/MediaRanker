class Work < ApplicationRecord
  belongs_to :category

  has_many :votes

  validates :title, presence: true, uniqueness: true

  def self.top_ten
    return self.all
  end
end
