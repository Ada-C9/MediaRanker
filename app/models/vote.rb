class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :work

  validates :user, uniqueness: { scope: :work}



  def date_voted
    return self.created_at.strftime("%m-%d-%Y")
  end
end
