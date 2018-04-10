class Art < ApplicationRecord
  validates :category, :title, presence: true
end
