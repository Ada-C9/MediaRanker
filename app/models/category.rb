class Category < ApplicationRecord
  has_many :works

  validates :name, presence: true
end
