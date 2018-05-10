class Vote < ApplicationRecord

  belongs_to :user
  belongs_to :work

  validates :work, uniqueness: { scope: [:user_id] }
  validates :work_id, presence: true
  validates :user_id, presence: true
  validates :user_id, uniqueness: { scope: :work_id , message: "User has already voted for this work"}
  
end
