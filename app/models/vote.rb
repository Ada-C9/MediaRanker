class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :work

  validates :user_id, presence: true
  validates :work_id, presence: true
  validates :work_id, uniqueness: { scope: :user_id }

  validates :user, uniqueness: { scope: :work, message: "You cannot vote for same work twice." }
end
