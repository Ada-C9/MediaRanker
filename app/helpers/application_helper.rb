module ApplicationHelper

def define_user(model)
  case model
  when @user
    @user = @user
  when @work
    @user = @work.users
  end
end


end
