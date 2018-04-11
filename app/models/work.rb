class Work < ApplicationRecord
  has_many :voteinfos

  validates :category, presence: true
  validates :title, presence: true

end
