class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def get_votes
    self.votes.count
  end

  def get_date
    date = self.created_at
    return date.strftime("%b %d, %Y")
  end

end
