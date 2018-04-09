class Vote < ApplicationRecord
  belong_to :works
  belong_to :users
end
