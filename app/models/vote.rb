class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :art, counter_cache: :vote_count

  validates :user_id, :art_id, presence: true
end
