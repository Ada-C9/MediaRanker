class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :work
  def unique_vote
    unless !Vote.all.any?{|v| v.user_id == user_id && v.work_id == work_id}
      errors[:name] << "You have already voted!"
    end
  end
  validate :unique_vote

end
