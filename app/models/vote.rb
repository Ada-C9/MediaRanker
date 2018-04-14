class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :work

  validates :user, uniqueness: { scope: :work, message: "You cannot vote for same work twice." }
end
