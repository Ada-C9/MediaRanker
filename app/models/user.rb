class User < ApplicationRecord
  has_many :voteinfos

  validates :name, presence: true, uniqueness: true
end
