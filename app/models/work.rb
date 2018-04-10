class Work < ApplicationRecord
  has_many :votes
  has_many :users, through: :votes
  belongs_to :category

  validates :title, presence: true

  def self.top_work
    return Work.first
  end
end
