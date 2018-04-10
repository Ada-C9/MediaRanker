class Work < ApplicationRecord
  has_many :votes

  validates :category, presence: true
            :title, presence: true

end
