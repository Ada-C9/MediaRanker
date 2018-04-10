class Work < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :category

  validates :title, presence: true
end
