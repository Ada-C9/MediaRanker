class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :work

  def self.max_votes

  end

end
