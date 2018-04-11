class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :work

  # this could be a useless model....?
end
