class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :work

  validates :user, uniqueness: {scope: :work, message: "You cannot vote on the same thing twice."}
end
