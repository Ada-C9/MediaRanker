class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def find_user
    @username = User.find_by(id: session[:user_id])
  end
end
