class User < ApplicationRecord
  has_many :votes

  validates_presence_of :user_name
end
