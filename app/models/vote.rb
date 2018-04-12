class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :work
  # validates :user_id, uniqueness: true
  # validates :work_id, uniqueness: true
end
