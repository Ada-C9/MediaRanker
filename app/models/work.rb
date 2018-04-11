class Work < ApplicationRecord
  has_many :votes

  validates :category, :title, presence: true
  validates :title , uniqueness: true


  # def votes
  #   votes = @works.votes += 1
  #
  # return votes
  #
  # end
end
