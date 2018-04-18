module UsersHelper
  def format_date(date)
    return date.strftime('%b %-d, %Y')
  end
end
