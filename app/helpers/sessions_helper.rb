module SessionsHelper

  # Logs in the given user
  # is this right?
  def log_in(user)
    session[:user_id] = user.id
  end
end
