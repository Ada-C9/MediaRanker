class Work < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :category

  validates :title, presence: true

  def self.top_work
    return Work.first
  end
end
