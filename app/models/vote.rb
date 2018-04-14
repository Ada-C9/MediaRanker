class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :work


  #how to validate the combo of work_id and user_id?
end
