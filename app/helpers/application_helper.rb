module ApplicationHelper
  def display_date(datetime)
    datetime.strftime("%b %d, %Y")
  end
end
