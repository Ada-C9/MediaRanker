class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :work, counter_cache: :vote_count

end
