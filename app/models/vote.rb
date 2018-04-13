class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :art

  validates :user_id, :art_id, presence: true
end
