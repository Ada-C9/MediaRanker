module ApplicationHelper

  def pretty_date(date)
    return date.strftime("%b %e, %Y")
  end

end
