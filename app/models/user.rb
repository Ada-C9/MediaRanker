class User < ApplicationRecord
  has_many :votes

  def self.logged_in?
    return session[:user_id] == self.id
  end

  def join_date
    self.created_at.strftime("%B %-d, %Y")
  end

end
