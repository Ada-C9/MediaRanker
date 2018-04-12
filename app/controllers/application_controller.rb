class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

# before_action :find_user

  # def find_user
  #   @user = User.find_by(id: session[:user_id])
  # end

  # #or from charles: either of these:
  # def find_user
  #   @user = session[:user]
  # end

  # helper_method :current_user
  # def current_user
  #   session[:user]
  # end

end
