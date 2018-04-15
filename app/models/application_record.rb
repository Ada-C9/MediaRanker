class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def format_date
    return self.created_at.strftime("%b %d, %Y")
  end
end
