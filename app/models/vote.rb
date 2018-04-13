class Vote < ApplicationRecord
  belongs_to :work
  belongs_to :user

  validates :user_id, presence: true, uniqueness: true
  validates :work_id, presence: true, uniqueness: true
end
