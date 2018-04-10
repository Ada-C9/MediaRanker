class User < ApplicationRecord
  validates :name, presence: true
  validates :joined, presence: true
end
