module UsersHelper

  def created_date(user)
    raw_date = self.created_at
    stripped_date = raw_date.strftime("%B %d, %Y")
    return stripped_date
  end

end
