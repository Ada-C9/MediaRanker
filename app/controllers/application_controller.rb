class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # application controller is the parent class
  # of all other controllers
  # all code here is automatically included in the rest of controller actions

  # helper line to find user for sessions
  # log in

  # finds user based on session
  helper_method :find_user

  def find_user
    # id: is the column id refers to the id column of the user model
    User.find_by(id: session[:user_id])
  end
end
