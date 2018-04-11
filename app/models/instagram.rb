class Instagram < ApplicationRecord
  validates :handle, presence: true
  validates :followers, presence: true

  def first_10
     self.first(10)
  end
end
