class User < ApplicationRecord
  has_many :votes

  validates :name, presence: true, uniqueness: true

  def created_date
    raw_date = self.created_at
    stripped_date = raw_date.strftime("%B %d, %Y")
    return stripped_date
  end

end
