class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

# this method is available to all other controllers
  def find_user
    @find_user = User.find_by(id: session[:user_id])
  end

  
end
