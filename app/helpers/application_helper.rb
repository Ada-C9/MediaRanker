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

end
