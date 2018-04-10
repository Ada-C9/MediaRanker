class Work < ApplicationRecord
  has_many :votes

  validates_presence_of :title, :category

end
