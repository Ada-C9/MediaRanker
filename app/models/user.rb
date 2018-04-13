class User < ApplicationRecord
  has_many :votes

  validates :user_name, :join_date, presence: true
end
