class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def find_session_user
    @session_user = User.find_by(id: session[:user_id])
  end

end
