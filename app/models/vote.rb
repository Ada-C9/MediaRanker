class Vote < ApplicationRecord
  belongs_to :work
  belongs_to :user
  
  validates :username, uniqueness: true
end
