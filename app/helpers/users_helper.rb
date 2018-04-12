module UsersHelper
  def user_creation_date(user)
    raw_date = user.created_at
    stripped_date = raw_date.strftime("%B %d, %Y")
    return stripped_date
  end
end
