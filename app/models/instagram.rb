class Instagram < ApplicationRecord
  validates :handle, presence: true
  validates :followers, presence: true
end
