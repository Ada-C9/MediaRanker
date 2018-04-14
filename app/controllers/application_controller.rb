class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :find_active_user

  def find_active_user
    @user = User.find_by(id: session[:user_id])
  end
end
