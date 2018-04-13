class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # application controller is the parent class
  # of all other controllers
  # all code here is automatically included in the rest of controller actions

  # helper line to find user for sessions
  # log in

  # finds user based on session
  def find_user
    @user = User.find_by(session[:user_id])
  end
end
