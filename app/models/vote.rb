class Vote < ApplicationRecord
  belongs_to :user
  belongs_to_and_has_many :works
end
