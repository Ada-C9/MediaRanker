class Work < ApplicationRecord
  belongs_to_and_has_many :votes

  validates :category, presence: true
            :title, presence: true

end
