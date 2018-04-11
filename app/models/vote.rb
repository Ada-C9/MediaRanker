class Vote < ApplicationRecord
  belongs_to :works
  belongs_to :users

def tally_votes
  votes += 1

  return votes
end

end
