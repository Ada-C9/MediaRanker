class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :publication

  validates :user, uniqueness: {scope: [:publication]}
end
