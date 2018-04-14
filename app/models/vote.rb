class Vote < ApplicationRecord
  belongs_to :work
  belongs_to :user

  # validate :user, :single_vote

  # def single_vote
  #   # user_id = session[:user_id]
  #   user = User.find(user_id)
  #   work = Work.find(work_id)
  #
  #   user.work.include? work
  # end
end
