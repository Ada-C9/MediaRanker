class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :work

  validates :user_id, presence: true, uniqueness: { scope: :work_id, message: "You've already voted for this work"}
  validates :work_id, presence:true

end
