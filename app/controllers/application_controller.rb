class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :find_current_user

  private

  # must use session instead of params bc session is cookie which is always available on every page as it's an item sent to the controller with every http request
  def find_current_user
    @current_user = User.find_by_id(session[:user_id])
  end

end
