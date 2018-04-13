class Vote < ApplicationRecord
  belongs_to :work
  belongs_to :user

  validates :work_id, uniqueness: {scope: :user_id}
  validates :user_id, uniqueness: {scope: :work_id}
end
