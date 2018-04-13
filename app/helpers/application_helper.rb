module ApplicationHelper

def define_user(model)
  case model
  when @user
    @user = @user
  when @work
    @user = @work.users
  end
end

def format_date(date)
  date.strftime("%m/%d/%Y")
end

def render_error(model)
    model.errors.messages.any?
end

def error_message_by_model(model)
  header = "A problem occured: Could not "
  case model
  when @work
    header += "create #{@work.category}"
    return header
  when @user
    header += "login. cannot be blank"
    return header
  else
  end
end

end
